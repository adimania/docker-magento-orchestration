FROM centos
MAINTAINER Aditya Patawari <aditya@adityapatawari.com>

RUN yum -y update && yum clean all
RUN yum -y install epel-release http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && yum clean all
RUN yum -y install --enablerepo remi-php56 httpd php-xml php-cli php-pdo php-common php-mcrypt php-intl php-mbstring php php-mysqlnd php-pecl-jsonc php-pecl-zip php-gd && yum clean all
RUN sed -i 's/;always_populate_raw_post_data/always_populate_raw_post_data/g' /etc/php.ini
ADD mage.conf /etc/httpd/conf.d/
ADD Magento-CE-2.0.1-2016-01-20-02-11-21.tar.gz /opt/magento
ADD run.sh /opt/run.sh
EXPOSE 80
CMD ["/bin/bash", "/opt/run.sh"]
