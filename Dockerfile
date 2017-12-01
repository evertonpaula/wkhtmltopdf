FROM php:7.1-fpm

RUN apt-get update && apt-get install -y vim git python python-dev python-pip python-virtualenv sudo

RUN apt-get install -y wget xvfb zlib1g libfontenc1 libxfont1 x11-common xfonts-encodings libfontconfig1 xfonts-utils xfonts-75dpi xfonts-base libxrender1 ucf fonts-dejavu-core ttf-bitstream-vera fonts-liberation fontconfig-config fontconfig libfreetype6 libjpeg62-turbo libpng12-0

RUN wget https://bitbucket.org/wkhtmltopdf/wkhtmltopdf/downloads/wkhtmltox-0.13.0-alpha-7b36694_linux-jessie-amd64.deb \
	&& dpkg -i wkhtmltox-0.13.0-alpha-7b36694_linux-jessie-amd64.deb \
	&& rm -rf wkhtmltox-0.13.0-alpha-7b36694_linux-jessie-amd64.deb

ENV	QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

RUN useradd admin && echo "admin:admin" | chpasswd && adduser admin sudo
RUN echo "root:root" | chpasswd	

CMD ["bash"]
