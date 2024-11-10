#!/bin/sh

echo $(date -u) "Создание папки для rclone..."

chmod 666 /root/.config/rclone/rclone.conf

# Содание папки, если её ещё нет
rclone mkdir "$RCLONE_REMOTE"

echo $(date -u) "Инициализация репозитория restic..."

if [ ! -f "$RESTIC_REPOSITORY/config" ]; then
    echo $(date -u) "Файл config не найден. Инициализация репозитория..."
    restic -r "$RESTIC_REPOSITORY" init
else
    echo $(date -u) "Репозиторий уже инициализирован. Файл config найден."
fi

echo $(date -u) "Инициализация завершена. Запускаем cron..."

crond -f