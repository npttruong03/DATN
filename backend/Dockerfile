FROM php:8.2-cli

# Cài các package cần thiết
RUN apt-get update && apt-get install -y \
    git unzip libzip-dev libpng-dev libonig-dev curl supervisor \
    && docker-php-ext-install pdo_mysql zip gd

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copy code
COPY . .

# Install dependencies
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Generate keys
RUN php artisan key:generate \
    && php artisan jwt:secret

# Expose port 8000 cho php artisan serve
EXPOSE 8000

# Chạy PHP built-in server + queue worker
COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["supervisord", "-n"]
