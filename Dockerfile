FROM php:8.3-apache

# Fix MPM conflict: disable prefork, enable event
RUN a2dismod mpm_prefork && a2enmod mpm_event

# Use PORT env var (Railway sets this dynamically)
ENV PORT=8080
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# Copy project files
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE ${PORT}
