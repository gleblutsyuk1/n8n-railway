# Используем официальный образ n8n с конкретной версией
FROM n8nio/n8n:1.40.0

# Устанавливаем переменные окружения
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=your_strong_password_123
ENV N8N_PORT=5678
ENV WEBHOOK_URL=https://your-app-name.railway.app
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Создаем папку для данных и устанавливаем правильные права
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# Переключаемся на пользователя node (от имени которого работает n8n)
USER node

# Устанавливаем рабочую директорию
WORKDIR /home/node/

# Открываем порт, который использует n8n
EXPOSE 5678

# Запускаем n8n (используем полный путь к бинарнику)
CMD ["/usr/local/bin/n8n", "start"]
