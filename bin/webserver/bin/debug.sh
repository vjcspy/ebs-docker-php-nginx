#!/bin/bash

# Simple script to enable or disable the xdebug extension

# Note that xargs removes whitespace
PHPINIDIR=`php --ini | head -1 | cut -d ":" -f 2 | xargs echo`

case $1 in
  on)
    [ -f $PHPINIDIR/conf.d/docker-php-ext-xdebug.ini_ ] && mv $PHPINIDIR/conf.d/docker-php-ext-xdebug.ini_ $PHPINIDIR/conf.d/docker-php-ext-xdebug.ini
    service php-fpm restart
    echo "Xdebug is ON"
  ;;
  off)
    [ -f $PHPINIDIR/conf.d/docker-php-ext-xdebug.ini ] && mv $PHPINIDIR/conf.d/docker-php-ext-xdebug.ini $PHPINIDIR/conf.d/docker-php-ext-xdebug.ini_
    service php-fpm restart
    echo "Xdebug is OFF"
  ;;
  *)
    ME=`basename "$0"`
    if [ -L $PHPINIDIR/conf.d/docker-php-ext-xdebug.ini ]; then
      . $ME off
    else
      . $ME on
    fi
  ;;
esac