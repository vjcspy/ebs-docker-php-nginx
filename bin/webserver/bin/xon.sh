#!/bin/bash

PHPINIDIR=`php --ini | head -1 | cut -d ":" -f 2 | xargs echo`
[ -f $PHPINIDIR/conf.d/xdebug.ini_ ] && mv $PHPINIDIR/conf.d/xdebug.ini_ $PHPINIDIR/conf.d/xdebug.ini
    service php-fpm restart
    echo "Xdebug is ON"