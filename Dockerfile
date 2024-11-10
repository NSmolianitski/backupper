FROM alpine:3.18

WORKDIR /app

# Устанавливаем rclone, restic и cron
RUN apk add --no-cache rclone restic busybox-suid

# Копируем скрипт резервного копирования и cron-задачу
COPY init.sh .
COPY backup.sh .
RUN chmod +x /app/backup.sh /app/init.sh

CMD ["/bin/sh", "/app/init.sh"]

