#!/bin/bash

DATE=$(date +\%F)
DEST="/var/www/techdotbit.in/full_backups"
mkdir -p $DEST

tar -czf $DEST/full-backup_$DATE.tar.gz /var/www/techdotbit.in \
    --exclude=/var/www/techdotbit.in/full_backups \
    --exclude=/var/www/techdotbit.in/git-backup.log \
    --exclude=/var/www/techdotbit.in/db-backup.log

cd /var/www/techdotbit.in
git add full_backups/full-backup_$DATE.tar.gz
git commit -m "Full weekly backup on $DATE"
git push origin ayesha

