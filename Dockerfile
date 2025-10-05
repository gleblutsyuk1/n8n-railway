FROM node:18-alpine

# Устанавливаем n8n
RUN npm install -g n8n

# Переменные окружения
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=your_strong_password_123
ENV N8N_PORT=$PORT

# Запускаем n8n
CMD ["n8n", "start"]
