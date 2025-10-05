# Используем официальный образ n8n с конкретной рабочей версией
FROM n8nio/n8n:0.240.0

# Устанавливаем переменные окружения
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=your_strong_password_123
ENV N8N_PORT=$PORT
ENV WEBHOOK_URL=https://your-app-name.railway.app
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Запускаем n8n
CMD ["n8n", "start"]
