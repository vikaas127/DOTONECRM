#!/bin/bash

cd /var/www/techdotbit.in

# Set Git identity (optional if already global)
git config user.name "Vikas Yadav"
git config user.email "vikas090497@gmail.com"

# Stage all changes
git add .

# Commit with timestamp
git commit -m "Auto-backup on $(date '+%Y-%m-%d %H:%M:%S')" || exit 0

# Push to GitHub
git push origin main
