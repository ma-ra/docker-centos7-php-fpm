FROM centos:7
MAINTAINER mara https://github.com/ma-ra/docker-centos7-php-fpm

RUN rm /etc/localtime ; ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

RUN yum -y install php-fpm php-ldap php-mysql mariadb; yum clean all

ADD php.ini /etc/
ADD www.conf /etc/php-fpm.d/
ADD .my.cnf /root/

RUN mkdir -p /var/lib/php/session && chown apache:apache /var/lib/php/session

ENTRYPOINT ["/usr/sbin/php-fpm"]

