# Используем официальный образ n8n
FROM n8nio/n8n:latest

# Устанавливаем переменные окружения
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=your_strong_password_123
ENV N8N_PORT=5678
ENV WEBHOOK_URL=https://your-app-name.railway.app

# Создаем папку для данных
RUN mkdir -p /home/node/.n8n

# Устанавливаем рабочую директорию
WORKDIR /data

# Открываем порт, который использует n8n
EXPOSE 5678

# Запускаем n8n
CMD ["n8n", "start"]
