#!/bin/bash
echo "nameserver localhost">/etc/resolv.conf
ln -fs /conf/* /etc/bind
exec /usr/sbin/named -f
