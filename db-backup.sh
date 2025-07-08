#!/bin/bash

# === CONFIG ===
DB_USER="dotadmin"
DB_PASS="StrongPassTDB@123!"
BACKUP_DIR="/var/www/html/db_backups"
DATE=$(date +\%Y-\%m-\%d_\%H-\%M-\%S)

# === CREATE BACKUP FOLDER IF NEEDED ===
mkdir -p "$BACKUP_DIR"

# === GET ALL TENANT DATABASES ===
databases=$(mysql -u$DB_USER -p$DB_PASS -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema|mysql|sys)")

# === LOOP THROUGH AND BACKUP EACH ===
for db in $databases; do
  FILE="${BACKUP_DIR}/${db}_${DATE}.sql"
  mysqldump -u$DB_USER -p$DB_PASS "$db" > "$FILE"
  gzip "$FILE"
done

# === OPTIONAL: PUSH TO GITHUB ===
cd /var/www/html
git add db_backups/*.gz
git commit -m "Auto DB backup on $DATE"
git push origin main

# === Auto-delete old backups (15+ days) ===
find $BACKUP_DIR -name "*.gz" -type f -mtime +15 -delete
