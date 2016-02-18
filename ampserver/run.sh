#!/bin/bash
set -e

AMP_DIR=/var/www/amp

PHP_ERROR_REPORTING=${PHP_ERROR_REPORTING:-"E_ALL & ~E_DEPRECATED & ~E_NOTICE"}
sed -ri "s/^error_reporting\s*=.*$//g" /etc/php5/apache2/php.ini
sed -ri "s/^error_reporting\s*=.*$//g" /etc/php5/cli/php.ini
echo "error_reporting = $PHP_ERROR_REPORTING" >> /etc/php5/apache2/php.ini
echo "error_reporting = $PHP_ERROR_REPORTING" >> /etc/php5/cli/php.ini

mkdir -p /etc/apache2/conf
cp /root/apache_common.conf /etc/apache2/conf/common.conf

# Create www structure
mkdir -p /var/log/apache2
mkdir -p /var/www/default
cp /root/info.php /var/www/default/

if [ ! -d "/var/www/amp" ]; then
    ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts
    git clone git@bitbucket.org:acommerceplatform/amp-project.git ${AMP_DIR}
fi

cp /root/main-local.php ${AMP_DIR}/common/config/main-local.php
cp /root/main-local.php ${AMP_DIR}/common/config/param-local.php

mkdir -p ${AMP_DIR}/console/runtime ${AMP_DIR}/backend/runtime ${AMP_DIR}/frontend/runtime
chown ${APACHE_RUN_USER}:${APACHE_RUN_GROUP} ${AMP_DIR}/console/runtime ${AMP_DIR}/backend/runtime ${AMP_DIR}/frontend/runtime

mkdir -p ${AMP_DIR}/backend/www/assets
chown ${APACHE_RUN_USER}:${APACHE_RUN_GROUP} ${AMP_DIR}/backend/www/assets

pushd .
cd ${AMP_DIR}
composer update
popd

exec /usr/sbin/apache2 -DFOREGROUND
