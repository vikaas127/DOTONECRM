#!/bin/bash

# === CONFIGURATION ===
BACKUP_DIR="/var/www/html/db_backups"
MYSQL_USER="dotadmin"
MYSQL_PASS="StrongPassTDB@123!"

DB_NAMES=(
  "ps_anondita"
  "ps_dac"
  "ps_dacfurniture"
  "ps_demo"
  "ps_ehsan"
  "ps_hcl"
  "ps_himalay"
  "ps_inkprint"
  "ps_kimchi"
  "ps_meraki"
  "ps_savit"
  "ps_splice"
  "ps_szw"
  "ps_t3digiport"
  "ps_techdotbit45"
  "ps_vns"
)

echo "🚨 WARNING: This will permanently delete and restore the following databases:"
printf '%s\n' "${DB_NAMES[@]}"
read -p "Proceed? (yes/no): " confirm
[[ "$confirm" != "yes" ]] && echo "Aborted." && exit 1

# === STEP 1: Stop MariaDB to safely delete files ===
echo "⏳ Stopping MariaDB..."
sudo systemctl stop mariadb

# === STEP 2: Delete database files directly ===
for DB in "${DB_NAMES[@]}"; do
  echo "🗑️ Removing database directory: $DB"
  sudo rm -rf /var/lib/mysql/$DB
done

# === STEP 3: Restart MariaDB ===
echo "🔁 Starting MariaDB..."
sudo systemctl start mariadb

# === STEP 4: Recreate and restore each database ===
for DB in "${DB_NAMES[@]}"; do
  echo "🛠️ Creating database: $DB"
  mysql -u root -e "CREATE DATABASE $DB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

  BACKUP_FILE=$(ls -t $BACKUP_DIR/${DB}_*.sql.gz 2>/dev/null | head -n1)

  if [[ -f "$BACKUP_FILE" ]]; then
    echo "📦 Importing: $(basename $BACKUP_FILE)"
    gunzip < "$BACKUP_FILE" | mysql -u "$MYSQL_USER" -p"$MYSQL_PASS" "$DB"
  else
    echo "❌ No backup file found for $DB"
  fi
done

echo "✅ All databases restored successfully!"
