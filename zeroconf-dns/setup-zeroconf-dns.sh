#!/bin/bash
#script to set up name discovery
#You do not need a dns server. After running this script as root, your system will adversise its name on the local subnet. You can then access it from a machine on the same subnet.
#Uses multicast DNS (mDNS) and DNS Service Discovery (DNS-SD).
#http://en.wikipedia.org/wiki/Zero-configuration_networking

#Warning: if the name in /etc/hostname is not unique then this will not help, please edit it.

apt-get install avahi-daemon

cat > /etc/avahi/services/multiple.service << EOF 
<?xml version="1.0" standalone='no'?>

<!DOCTYPE service-group SYSTEM "avahi-service.dtd">

<service-group>

        <name replace-wildcards="yes">%h</name>

        <service>

                <type>_device-info._tcp</type>

                <port>0</port>

                <txt-record>model=RackMac</txt-record>

        </service>

        <service>

                <type>_ssh._tcp</type>

                <port>22</port>

        </service>

</service-group>
EOF

/etc/init.d/avahi-daemon restart
