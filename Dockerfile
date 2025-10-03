# Используем Node.js образ и устанавливаем n8n вручную
FROM node:18-alpine

# Устанавливаем зависимости и n8n
RUN apk add --no-cache bash && \
    npm install -g n8n

# Создаем пользователя и рабочую директорию
RUN adduser -D -h /home/node -s /bin/bash node && \
    mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

# Переключаемся на пользователя node
USER node

# Устанавливаем рабочую директорию
WORKDIR /home/node

# Устанавливаем переменные окружения
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=your_strong_password_123
ENV N8N_PORT=$PORT
ENV WEBHOOK_URL=https://your-app-name.railway.app
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Открываем порт
EXPOSE $PORT

# Запускаем n8n
CMD ["n8n", "start"]
