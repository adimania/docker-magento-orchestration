#!/bin/bash

if [ ! -f /tmp/magento-setup.lock ];
then
    touch /tmp/magento-setup.lock
    mv /opt/magento /var/www/html/magento
    chown -R apache:apache /var/www/html/magento && find /var/www/html/magento/ -type d -exec chmod 770 {} \; && find /var/www/html/magento/ -type f -exec chmod 660 {} \; && chmod u+x /var/www/html/magento/bin/magento
    cd /var/www/html/magento/bin
    su -s /bin/sh apache -c './magento setup:install --base-url=$BASE_URL --db-host=$DB_HOST --db-name=$DB_NAME --db-user=$DB_USER --db-password=$DB_PASSWORD --admin-firstname=$ADMIN_FNAME --admin-lastname=$ADMIN_LNAME --admin-email=$ADMIN_EMAIL --admin-user=$ADMIN_USER --admin-password=$ADMIN_PASSWORD --use-rewrites=1'
else 
    rm /opt/magento
    echo "Setup looks OK! Starting webserver..."
fi

/sbin/httpd -DFOREGROUND
