FROM php:7.2-apache
ENV APACHE_DOCUMENT_ROOT /var/www/html/xerteonlinetoolkits
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN apt-get update -y && apt-get install -y
RUN apt-get install -y git-all
RUN docker-php-ext-install mysqli pdo pdo_mysql
WORKDIR /var/www/html
RUN git clone https://github.com/thexerteproject/xerteonlinetoolkits.git
WORKDIR xerteonlinetoolkits
RUN chown -R www-data:www-data .
EXPOSE 80
EXPOSE 3306