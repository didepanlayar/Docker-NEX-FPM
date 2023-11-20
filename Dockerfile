FROM php:7.4.33-fpm-alpine

# Install Dependencies, Nginx, NodeJS and Composer
RUN apk update && \
    apk add --no-cache \
        tzdata \
        wget \
        nano \
        git \
        supervisor \
        nginx \
        nodejs \
        npm && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    ln -s /usr/bin/composer /usr/local/bin/composer && \
    rm -rf /var/cache/apk/*

# PHP Extension
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS && \
        pecl install uploadprogress && \
        docker-php-ext-enable uploadprogress && \
        apk del .build-deps $PHPIZE_DEPS && \
        chmod uga+x /usr/local/bin/install-php-extensions && sync && \
        install-php-extensions \
            bcmath \
            bz2 \
            calendar \
            curl \
            exif \
            fileinfo \
            ftp \
            gd \
            gettext \
            imagick \
            imap \
            intl \
            ldap \
            mcrypt \
            memcached \
            mongodb \
            mysqli \
            opcache \
            pdo \
            pdo_mysql \
            redis \
            soap \
            sodium \
            sysvsem \
            sysvshm \
            xmlrpc \
            xsl \
            zip

RUN apk add --no-cache \
        --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --virtual \
        .shadow-deps \
        shadow && \
    usermod -u 1000 www-data && \
    groupmod -g 1000 www-data && \
    apk del .shadow-deps

# Configuration
COPY config/config.sh /etc/config.sh
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN sh /etc/config.sh

# Expose HTTP and HTTPS ports
EXPOSE 80
EXPOSE 443

# Start Services
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
