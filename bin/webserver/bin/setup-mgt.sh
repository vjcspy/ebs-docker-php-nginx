#!/usr/bin/env bash

php bin/magento setup:install \
        --no-interaction \
        --use-rewrites=${MAGENTO_INSTALL_USE_REWRITE} \
        --backend-frontname=${MAGENTO_ADMIN_URI} \
        --session-save=db \
        --db-host=${MAGENTO_DB_HOST} \
        --db-name=${MAGENTO_DB_NAME} \
        --db-user=${MAGENTO_DB_USER} \
        --db-password=${MAGENTO_DB_PASSWORD} \
        --base-url=${MAGENTO_INSTALL_BASE_URL} \
        --base-url-secure=${MAGENTO_INSTALL_BASE_SECURE_URL} \
        --use-secure=${MAGENTO_INSTALL_USE_SECURE} \
        --use-secure-admin=${MAGENTO_INSTALL_USE_SECURE_ADMIN} \
        --language=${MAGENTO_INSTALL_LANGUAGE} \
        --timezone=${MAGENTO_INSTALL_TIMEZONE} \
        --currency=${MAGENTO_INSTALL_CURRENCY} \
        --admin-firstname=${MAGENTO_INSTALL_ADMIN_FIRSTNAME} \
        --admin-lastname=${MAGENTO_INSTALL_ADMIN_LASTNAME} \
        --admin-email=${MAGENTO_INSTALL_ADMIN_EMAIL} \
        --admin-user=${MAGENTO_INSTALL_ADMIN_USERNAME} \
        --admin-password=${MAGENTO_INSTALL_ADMIN_PASSWORD}