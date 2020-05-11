#!/bin/bash

PHPINIDIR=`php --ini | head -1 | cut -d ":" -f 2 | xargs echo`
[ -f $PHPINIDIR/conf.d/docker-php-ext-xdebug.ini_ ] && mv $PHPINIDIR/conf.d/docker-php-ext-xdebug.ini_ $PHPINIDIR/conf.d/docker-php-ext-xdebug.ini
    service php-fpm restart
    echo "Xdebug is ON"