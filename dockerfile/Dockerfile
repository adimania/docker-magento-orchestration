FROM centos
MAINTAINER Aditya Patawari <aditya@adityapatawari.com>

RUN yum -y update && yum clean all
RUN yum -y install epel-release http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && yum clean all
RUN yum -y install --enablerepo remi-php56 httpd php-xml php-cli php-pdo php-common php-mcrypt php-intl php-mbstring php php-mysqlnd php-pecl-jsonc php-pecl-zip php-gd && yum clean all
RUN sed -i 's/;always_populate_raw_post_data/always_populate_raw_post_data/g' /etc/php.ini
ADD mage.conf /etc/httpd/conf.d/
ADD Magento-CE-2.0.1-2016-01-20-02-11-21.tar.gz /var/www/html/magento
RUN chown -R apache:apache /var/www/html/magento && find /var/www/html/magento/ -type d -exec chmod 770 {} \; && find /var/www/html/magento/ -type f -exec chmod 660 {} \; && chmod u+x /var/www/html/magento/bin/magento
EXPOSE 80
CMD ["/sbin/httpd", "-DFOREGROUND"]
