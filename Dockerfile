FROM ubuntu:trusty

# RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install -y php5
RUN apt-get install -y mysql-server
RUN apt-get install -y php5-mysql php5-curl
RUN apt-get install -y curl

RUN curl -O http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64_5.1.2.tar.gz
RUN tar vxfz ioncube_loaders_lin_x86-64_5.1.2.tar.gz

COPY /ioncube /ioncube
RUN echo "zend_extension=/ioncube/ioncube_loader_lin_5.5.so" > /etc/php5/cli/php.ini.new && cat /etc/php5/cli/php.ini >> /etc/php5/cli/php.ini.new && mv /etc/php5/cli/php.ini.new /etc/php5/cli/php.ini
RUN echo "zend_extension=/ioncube/ioncube_loader_lin_5.5.so" > /etc/php5/apache2/php.ini.new && cat /etc/php5/apache2/php.ini >> /etc/php5/apache2/php.ini.new && mv /etc/php5/apache2/php.ini.new /etc/php5/apache2/php.ini
