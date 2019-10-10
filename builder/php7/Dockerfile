# zcloud-php-builder
FROM php:alpine

# Maintainer 
LABEL maintainer="Gao <gaoshiming@zdns.cn>"

# TODO: Rename the builder environment variable to inform users about application you provide them
# ENV BUILDER_VERSION 1.0

LABEL io.k8s.description="Platform for building php" \
      io.k8s.display-name="builder zcloud php" \
      io.expose-services="80:http" \
      io.tags="builder,zcloud,php,php7"

# Install required packages here:
# Add basics first
RUN apk update && apk upgrade && apk add bash apache2 php7-apache2 curl ca-certificates openssl openssh git php7 php7-phar php7-json php7-iconv php7-openssl tzdata openntpd nano

# Setup apache and php
RUN apk add \
	php7-ftp \
	php7-xdebug \
	php7-mcrypt \
	php7-mbstring \
	php7-soap \
	php7-gmp \
	php7-pdo_odbc \
	php7-dom \
	php7-pdo \
	php7-zip \
	php7-mysqli \
	php7-sqlite3 \
	php7-pdo_pgsql \
	php7-bcmath \
	php7-gd \
	php7-odbc \
	php7-pdo_mysql \
	php7-pdo_sqlite \
	php7-gettext \
	php7-xml \
	php7-xmlreader \
	php7-xmlwriter \
	php7-tokenizer \
	php7-xmlrpc \
	php7-bz2 \
	php7-pdo_dblib \
	php7-curl \
	php7-ctype \
	php7-session \
	php7-redis \
	php7-exif \
	php7-intl \
	php7-fileinfo \
        php7-ldap \
        php7-simplexml \
	php7-apcu

RUN cp /usr/bin/php7 /usr/bin/php \
        && rm -f /var/cache/apk/*

# Add apache to run and configure
RUN sed -i "s/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/" /etc/apache2/httpd.conf \
    && sed -i "s/#LoadModule\ session_module/LoadModule\ session_module/" /etc/apache2/httpd.conf \
    && sed -i "s/#LoadModule\ session_cookie_module/LoadModule\ session_cookie_module/" /etc/apache2/httpd.conf \
    && sed -i "s/#LoadModule\ session_crypto_module/LoadModule\ session_crypto_module/" /etc/apache2/httpd.conf \
    && sed -i "s/#LoadModule\ deflate_module/LoadModule\ deflate_module/" /etc/apache2/httpd.conf \
    && sed -i "s#^DocumentRoot \".*#DocumentRoot \"/opt/app-root\"#g" /etc/apache2/httpd.conf \
    && sed -i "s#/var/www/localhost/htdocs#/opt/app-root#" /etc/apache2/httpd.conf \
    && printf "\n<Directory \"/opt/app-root\">\n\tAllowOverride All\n</Directory>\n" >> /etc/apache2/httpd.conf

RUN mkdir -p /opt/app-root && chown -R apache:apache /opt/app-root && chmod -R 755 /opt/app-root

# TODO (optional): Copy the builder files into /opt/app-root
# COPY ./<builder_folder>/ /opt/app-root/

WORKDIR /opt/app-root

# Copy the S2I scripts to /usr/libexec/s2i
COPY ./s2i/bin/ /usr/libexec/s2i
LABEL io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

# Drop the root user and make the content of /opt/app-root owned by user 1001
#RUN chown -R 1001:1001 /opt/app-root

# This default user 
#USER 1000

# TODO: Set the default port for applications built using this image
EXPOSE 80

# Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
