#!/bin/bash

[ -f $PHPINIDIR/conf.d/docker-php-ext-xdebug.ini_ ] && mv $PHPINIDIR/conf.d/docker-php-ext-xdebug.ini_ $PHPINIDIR/conf.d/docker-php-ext-xdebug.ini
    service php-fpm restart
    echo "Xdebug is ON"