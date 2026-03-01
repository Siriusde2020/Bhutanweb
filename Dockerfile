FROM php:8.3-cli

COPY . /var/www/html/
WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 8080

CMD ["sh", "-c", "php -S 0.0.0.0:${PORT:-8080}"]
