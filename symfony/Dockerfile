# Utiliser l'image PHP 8.3
FROM php:8.3-apache

  # Mise à jour des dépôts et installation des paquets système et bibliothèques nécessaires
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
  \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
  locales apt-utils git libicu-dev g++ libpng-dev libxml2-dev libzip-dev libonig-dev libxslt-dev unzip \
  \
  # Configurer les locales (anglais et français)
  && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
  && echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen \
  \
  # Installer la dernière version stable de Composer
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  \
  # Installer Symfony CLI (outil CLI Symfony)
  && curl -sS https://get.symfony.com/cli/installer | bash \
  && mv /root/.symfony*/bin/symfony /usr/local/bin/symfony \
  \
  # Installer les extensions PHP nécessaires
  && docker-php-ext-configure intl \
  && docker-php-ext-install \
      pdo pdo_mysql opcache intl zip calendar dom mbstring gd xsl \
  \
  # Installer et activer l'extension APCu
  && pecl install apcu \
  && docker-php-ext-enable apcu \
  \
  # Nettoyage des fichiers temporaires pour réduire la taille de l'image
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Définir le répertoire de travail
WORKDIR /var/www/backend

# Copier la configuration d'Apache si nécessaire
# COPY ./apache/vhosts.conf /etc/apache2/sites-available/000-default.conf
