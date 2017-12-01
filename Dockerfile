FROM php:7.1-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev
RUN apt-get install -y vim cron supervisor
RUN docker-php-ext-install mbstring pdo_mysql tokenizer
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev \
	&& docker-php-ext-install -j$(nproc) iconv mcrypt \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd

RUN apt-get install -y wget xvfb zlib1g libfontenc1 libxfont1 x11-common xfonts-encodings libfontconfig1 xfonts-utils xfonts-75dpi xfonts-base libxrender1 ucf fonts-dejavu-core ttf-bitstream-vera fonts-liberation fontconfig-config fontconfig libfreetype6 libjpeg62-turbo libpng12-0

RUN wget https://bitbucket.org/wkhtmltopdf/wkhtmltopdf/downloads/wkhtmltox-0.13.0-alpha-7b36694_linux-jessie-amd64.deb \
	&& dpkg -i wkhtmltox-0.13.0-alpha-7b36694_linux-jessie-amd64.deb \
	&& rm -rf wkhtmltox-0.13.0-alpha-7b36694_linux-jessie-amd64.deb

ENV	QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

CMD supervisord -c /etc/supervisor/supervisord.conf && supervisorctl reload && php-fpm
