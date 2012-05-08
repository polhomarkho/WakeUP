WakeUP
======

A ruby script that wake up your computer over the internet (Wake On Wan).  
This script is useful if your computer is behind a router and needs to be started up.

### USAGE:

`./wakeup <host> <port> <mac address>`

host: the url of your router.  
port: the port on which you set-up the wake-on-lan on your router.  
mac address: the mac address of the computer you want to start.  

### EXAMPLE:

`./wakeup myrouter.com 1234 00-11-12-FB-1A-10`