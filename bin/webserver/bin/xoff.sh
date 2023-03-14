#!/bin/bash

PHPINIDIR=`php --ini | head -1 | cut -d ":" -f 2 | xargs echo`

[ -f $PHPINIDIR/conf.d/xdebug.ini ] && mv $PHPINIDIR/conf.d/xdebug.ini $PHPINIDIR/conf.d/xdebug.ini_
    service php-fpm restart
    echo "Xdebug is OFF"