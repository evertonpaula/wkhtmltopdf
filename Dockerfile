FROM php:7-fpm

RUN apt-get update && apt-get install -y vim git python python-dev python-pip python-virtualenv sudo

RUN apt-get install -y wget xvfb zlib1g libfontenc1 libxfont1 x11-common xfonts-encodings libfontconfig1 xfonts-utils xfonts-75dpi xfonts-base libxrender1 ucf fonts-dejavu-core ttf-bitstream-vera fonts-liberation fontconfig-config fontconfig libfreetype6 libjpeg62-turbo libpng12-0

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz \
	&& tar -Jxf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz \
	&& rm -rf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz \
	&& mv wkhtmltox/share/* /usr/local/share/ \
	&& mv wkhtmltox/bin/* /usr/local/bin/ \
	&& mv wkhtmltox/include/* /usr/local/include/ \
	&& mv wkhtmltox/lib/* /usr/local/lib/ \
	&& rm -rf wkhtmltox

ENV	QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

CMD ["bash"]