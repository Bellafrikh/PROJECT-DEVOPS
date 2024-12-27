# Utilisation de l'image PHP 8.1
ARG PHP_VERSION=8.1
FROM php:${PHP_VERSION}-apache

# Installation des dépendances nécessaires
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql zip

# Activer mod_rewrite pour Apache
RUN a2enmod rewrite

# Définir le répertoire de travail
WORKDIR /var/www/html

# Copier les fichiers du projet
COPY . .

# Exposer le port 80
EXPOSE 80
