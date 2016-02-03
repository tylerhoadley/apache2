FROM debian:jessie
MAINTAINER tyler.hoadley[AT]computersthatwork[DOT]ca
RUN apt-get update
RUN apt-get install -y apache2 && source /etc/apache2/envvars
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ONBUILD ADD . /var/www/
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]
