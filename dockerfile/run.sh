#!/bin/bash

if [ ! -f /tmp/magento-setup.lock ];
then
    touch /tmp/magento-setup.lock
    mv /opt/magento /var/www/html/magento
    chown -R apache:apache /var/www/html/magento && find /var/www/html/magento/ -type d -exec chmod 770 {} \; && find /var/www/html/magento/ -type f -exec chmod 660 {} \; && chmod u+x /var/www/html/magento/bin/magento
    cd /var/www/html/magento/bin
    su -s /bin/sh apache -c './magento setup:install --base-url=http://shop.adi.im/magento/ --db-host=mysql --db-name=magento --db-user=root --db-password=my-secret-pw --admin-firstname=Magento --admin-lastname=User --admin-email=user@example.com --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1'
else 
    rm /opt/magento
    echo "Setup looks OK! Starting webserver..."
fi

/sbin/httpd -DFOREGROUND
