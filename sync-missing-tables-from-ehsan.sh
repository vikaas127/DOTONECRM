#!/usr/bin/env bash
set -euo pipefail

# =============== EDIT THESE =================
MYSQL="mysql -u root -p"   # add -h if remote; will prompt for pwd
GOOD_DB="ps_ehsan"         # golden DB
TARGET_DBS=(               # all others (exclude ps_ehsan)
  ps_abc1 
)
DRY_RUN="yes"              # set to "no" to APPLY changes
# ============================================

q() { $MYSQL -N -e "$1"; }

# Detects '<prefix>tbl...' in any table name and returns '<prefix>'
detect_prefix() {
  local db="$1"
  local t
  t=$(q "SELECT TABLE_NAME FROM information_schema.TABLES
          WHERE TABLE_SCHEMA='${db}' AND TABLE_TYPE='BASE TABLE'
            AND TABLE_NAME LIKE '%tbl%' ORDER BY TABLE_NAME LIMIT 1;")
  if [[ -z "$t" ]]; then echo ""; return; fi
  if [[ "$t" =~ (.*)tbl.* ]]; then
    echo "${BASH_REMATCH[1]}"
  elif [[ "$t" =~ (.*_) ]]; then
    echo "${BASH_REMATCH[1]}"
  else
    echo ""
  fi
}

# Lists base names (table names with prefix removed)
list_base_tables() {
  local db="$1" prefix="$2"
  if [[ -z "$prefix" ]]; then
    q "SELECT TABLE_NAME FROM information_schema.TABLES
         WHERE TABLE_SCHEMA='${db}' AND TABLE_TYPE='BASE TABLE' ORDER BY 1;"
  else
    q "SELECT REPLACE(TABLE_NAME, '${prefix}', '') AS base
         FROM information_schema.TABLES
        WHERE TABLE_SCHEMA='${db}' AND TABLE_TYPE='BASE TABLE'
          AND TABLE_NAME LIKE '${prefix}%'
        ORDER BY 1;"
  fi
}

# Build sorted unique set from stdin
toset() { sort -u; }

echo "== Discovering golden prefix from ${GOOD_DB} =="
GOOD_PREFIX=$(detect_prefix "$GOOD_DB")
if [[ -z "$GOOD_PREFIX" ]]; then
  echo "ERROR: Could not detect prefix in ${GOOD_DB} (expected names like '<prefix>tbl...')."
  exit 1
fi
echo "Golden prefix: '${GOOD_PREFIX}'"

echo
echo "== Loading golden base table list =="
GOOD_BASES=$(list_base_tables "$GOOD_DB" "$GOOD_PREFIX" | toset)
if [[ -z "$GOOD_BASES" ]]; then
  echo "ERROR: No tables found in ${GOOD_DB}."
  exit 1
fi
GOOD_COUNT=$(echo "$GOOD_BASES" | wc -l | tr -d ' ')
echo "Golden base tables count: ${GOOD_COUNT}"

echo
echo "== Comparing and preparing fixes (dry-run=${DRY_RUN}) =="

TOTAL_CREATED=0
for DB in "${TARGET_DBS[@]}"; do
  [[ "$DB" == "$GOOD_DB" ]] && continue

  echo
  echo "---- ${DB} ----"
  BAD_PREFIX=$(detect_prefix "$DB")
  if [[ -z "$BAD_PREFIX" ]]; then
    echo "WARN: Could not detect a prefix in ${DB}. Skipping."
    continue
  fi
  echo "Detected prefix: '${BAD_PREFIX}'"

  BAD_BASES=$(list_base_tables "$DB" "$BAD_PREFIX" | toset)

  # Missing = GOOD_BASES - BAD_BASES
  MISSING=$(comm -23 <(echo "$GOOD_BASES") <(echo "$BAD_BASES"))
  if [[ -z "$MISSING" ]]; then
    echo "✅ No missing tables."
    continue
  fi

  MISS_COUNT=$(echo "$MISSING" | wc -l | tr -d ' ')
  echo "Missing ${MISS_COUNT} table(s):"
  echo "$MISSING" | sed 's/^/  - /'

  # Build SQL
  TMP_SQL="/tmp/create_missing_${DB}_$$.sql"
  {
    echo "SET FOREIGN_KEY_CHECKS=0;"
    echo "SET NAMES utf8mb4;"
    while IFS= read -r base; do
      good_full="${GOOD_PREFIX}${base}"
      bad_full="${BAD_PREFIX}${base}"
      echo "-- ${DB}: ${bad_full}  (from ${GOOD_DB}.${good_full})"
      echo "CREATE TABLE \`${DB}\`.\`${bad_full}\` LIKE \`${GOOD_DB}\`.\`${good_full}\`;"
    done <<< "$MISSING"
    echo "SET FOREIGN_KEY_CHECKS=1;"
  } > "$TMP_SQL"

  echo "SQL file: $TMP_SQL"
  head -n 20 "$TMP_SQL" || true

  if [[ "$DRY_RUN" == "no" ]]; then
    echo "Applying to ${DB}..."
    $MYSQL < "$TMP_SQL"
    CREATED=$MISS_COUNT
    TOTAL_CREATED=$((TOTAL_CREATED + CREATED))
    echo "✅ Created ${CREATED} table(s) in ${DB}."
  else
    echo "Dry-run: not applying."
  fi
done

echo
if [[ "$DRY_RUN" == "no" ]]; then
  echo "== Done. Total tables created across DBs: ${TOTAL_CREATED} =="
else
  echo "== Dry-run complete. Review the SQL files in /tmp. Set DRY_RUN=\"no\" to apply. =="
fi
