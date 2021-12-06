FROM php:fpm


RUN apt-get update \
    && apt-get install -y --no-install-recommends  libpq-dev libpq5 \
    && docker-php-ext-install pgsql \
    && apt-get purge -y --auto-remove libpq-dev \
    && rm -rf /var/lib/apt/lists/

RUN pecl install xdebug && docker-php-ext-enable xdebug
