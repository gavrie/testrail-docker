FROM ubuntu:trusty

RUN apt-get update && apt-get install -y --no-install-recommends \
    php5 php5-cli php5-mysql php5-curl \
    mysql-server \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64_5.1.2.tar.gz && \
    tar vxfz ioncube_loaders_lin_*.tar.gz && \
    rm -f ioncube_loaders_lin_*.tar.gz

RUN echo "zend_extension=/ioncube/ioncube_loader_lin_5.5.so" > /etc/php5/cli/php.ini.new && \
    cat /etc/php5/cli/php.ini >> /etc/php5/cli/php.ini.new && \
    mv /etc/php5/cli/php.ini.new /etc/php5/cli/php.ini && \
    echo "zend_extension=/ioncube/ioncube_loader_lin_5.5.so" > /etc/php5/apache2/php.ini.new && \
    cat /etc/php5/apache2/php.ini >> /etc/php5/apache2/php.ini.new && \
    mv /etc/php5/apache2/php.ini.new /etc/php5/apache2/php.ini

COPY testrail-*.zip /
RUN cd /var/www/html && unzip -q /testrail-*.zip

COPY config.php /var/www/html/testrail/config.php
COPY testrail.sql /
COPY run.sh /

CMD /run.sh
