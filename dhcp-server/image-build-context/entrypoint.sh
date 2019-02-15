#!/bin/bash
ln -fs /conf/* /etc/dhcp/
exec dhcpd -f
