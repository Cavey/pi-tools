#pi-tools

Tools for use with a raspberry pi (aimed at newer users).  

Currently includes:

* noroot-gpio
* mailmyip
* zeroconf-dns

##noroot-gpio

Sets up the GPIO pins to be either accessible by non-root users or can secure them again.  If you are wanting it to be enabled on boot, adding something to cron should work.  i.e.

`crontab -e`

and add the line

`@reboot /path/to/export_gpio.sh`

##mailmyip

Respbery Pis are often used headless (i.e. without a monitor) and SSHing into it.  If your network does not handle DHCP leases well, you will find the local IP changes constantly.  

This set of scripts sets up SSMTP and uses the if-up.d to trigger the email of all IP addresses to a designated account (assuming it has internet access).

The file "mailmyip" needs to go into `/etc/network/if-up.d` and made executable so that it is run on boot.

See the content of `mailmyip/README` for how to install SSMTP and copy riles around.  Remember to run the commands as root..

##zeroconf-dns

An alternative to mailmyip, using avhi can work on a network without internet access.

Provided by Richard Delorenzi https://github.com/richard-delorenzi.
