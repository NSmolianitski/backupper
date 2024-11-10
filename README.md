# Что это такое
Docker-контейнер для создания резервных копий с помощью rclone и restic

# Как использовать
1. Настроить docker-compose по примеру docker-compose.example.yaml
2. Положить рядом с docker-compose файлы:
	1. rclone.conf с конфигурацией для rclone
	2. cron.conf с настройками для cron (пример в cron.example.conf)
	3. .env c переменными для docker-compose (пример в .env.example)