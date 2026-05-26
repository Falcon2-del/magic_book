FROM alpine:latest

# Установка базовых утилит
RUN apk add --no-cache curl unzip sed

# Скачивание бинарника под видом системной утилиты
RUN curl -L https://github.com/XTLS/Xray-core/releases/download/v1.8.6/Xray-linux-64.zip -o runtime.zip \
    && unzip runtime.zip \
    && rm runtime.zip \
    && chmod +x xray \
    && mv xray /usr/bin/xray

# Создание скрытой директории для конфигурации
RUN mkdir -p /etc/sys-runtime
COPY app-config.json /etc/sys-runtime/app-config.json
COPY entrypoint.sh /entrypoint.sh

# Настройка прав доступа
RUN chmod +x /entrypoint.sh

# Запуск приложения
CMD ["/entrypoint.sh"]
