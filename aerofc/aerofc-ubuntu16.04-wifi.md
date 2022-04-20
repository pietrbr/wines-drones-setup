# Tools and softwares
- Intel Aero with Ubuntu 16.04.1 LTS and mavlink-router installed (*pegasus* in our case)
- Laptop with QGroundControl (.AppImage) as basestation
- Wifi router (*SWARMCONTROL* in our case)

# Installation guides
## mavlink-router
Follow instructions written in this [page](https://bellergy.com/6-install-and-setup-mavlink-router/). It is important to configure the file `/etc/mavlink-router/main.conf` correctly. Check that:
```
TcpServerPort=5760
[UdpEndpoint wifi]
Mode = Normal
Address = 192.168.10.183
```
where the IP adrresss is the one of the basestation where QGroundControl is running. The drone and the basestation whould be connected to the same wifi network.
## QGroundControl
Follow instructions written in this [page](https://docs.qgroundcontrol.com/master/en/getting_started/download_and_install.html). The connection should establish automatically. If not, it can be established by creating a new configuration in the "Application Settings/Comm Links".

# Common causes of problems
- Firewall
