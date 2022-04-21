# DJI-M100 + NUC: connection over wifi network

## Tools and softwares

- Drone: DJI-M100 with Pixhawk FCU
- Companion computer: Intel NUC with Ubuntu 20.04.2 LTS and mavlink-router installed (*wines-nuc2* in our case)
- Basestation: Laptop with QGroundControl (*.AppImage* file)
- Wifi router (*SWARMCONTROL* in our case)

## Installation guides

### mavlink-router

Follow instructions written in this [page](https://github.com/mavlink-router/mavlink-router). It is important to configure the file `/etc/mavlink-router/main.conf` correctly. Check that:

```conf
TcpServerPort = 5760 # under [General], to open 5760 port for TCP connection
[UdpEndpoint wifi] # wifi is the name given to the connection
Address = 192.168.10.183 # IP address of the basestation where QGroundControl is running
```

The drone and the basestation must be connected to the same wifi network. `main.conf` is the configuration file for the Alienware basestation and the pegasus drone wih Intel Aero.

### QGroundControl

Follow instructions written in this [page](https://docs.qgroundcontrol.com/master/en/getting_started/download_and_install.html). The connection should establish automatically. If not, it can be established by creating a new configuration in the "Application Settings/Comm Links".

## Common causes of problems

- Firewall denies connection
