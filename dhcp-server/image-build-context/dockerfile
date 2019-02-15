FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y isc-dhcp-server
RUN touch /var/lib/dhcp/dhcpd.leases
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
