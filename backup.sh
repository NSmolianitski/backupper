#!/bin/sh

echo $(date -u) "Creating restic backup"
# Создание резервной копии
restic -r "$RESTIC_REPOSITORY" backup /data --verbose

echo $(date -u) "Syncronizing remote with rclone"
# Синхронизация с Yandex Disk через rclone
rclone sync "$RESTIC_REPOSITORY" "$RCLONE_REMOTE"
