# Use PHP 8.1 CLI as base
FROM php:8.1-cli

# Install dependencies and extensions
RUN apt-get update && apt-get install -y \
    unzip \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libsqlite3-dev \
    && docker-php-ext-install pdo pdo_sqlite gd zip

# Copy project files
COPY . /app
WORKDIR /app

# Start Cockpit CMS using PHP built-in server
CMD ["php", "-S", "0.0.0.0:10000", "-t", "."]
