FROM centos:latest
MAINTAINER rohinisbag2898@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd zip unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page294/rent4u.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip rent4u.zip
RUN pwd
RUN ls -la
RUN cp -rvf rent4u-html/* .
RUN rm -rf rent4u-html rent4u.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
