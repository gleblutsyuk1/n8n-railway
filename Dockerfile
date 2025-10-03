# Используем официальный образ Node.js
FROM node:18-alpine

# Устанавливаем n8n глобально
RUN npm install -g n8n

# Создаем пользователя и рабочую директорию
RUN adduser -D -h /home/node -s /bin/bash node
WORKDIR /home/node

# Устанавливаем переменные окружения
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=your_strong_password_123
ENV N8N_PORT=$PORT
ENV WEBHOOK_URL=https://your-app-name.railway.app
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Переключаемся на пользователя node
USER node

# Создаем папку для данных n8n
RUN mkdir -p /home/node/.n8n

# Запускаем n8n
CMD ["n8n", "start"]
