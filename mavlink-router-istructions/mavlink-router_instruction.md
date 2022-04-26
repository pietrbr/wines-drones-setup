# mavlink-router instruction

mavlink-router should be enough to enable the connection and message forwarding between the base station and the drone (see [this page](https://docs.px4.io/v1.12/en/companion_computer/pixhawk_companion.html) and [this other page](https://docs.px4.io/v1.12/en/ros/offboard_control.html) for more information). [This github repo](https://github.com/mavlink-router/mavlink-router) explains how to install and setup mavlink-router, while [this other page](https://bellergy.com/6-install-and-setup-mavlink-router/) tries to do the same, but with some error (check the github repo, it is enough).

## Install

Use `mavlink-router-install.sh` script to install mavlink-router. Before running the bash script, change the parameter of the `[UartEndpoint uart]` section to correspond to your current setup (use command `dmesg | grep tty` to catch current used USB serial port used to connect to FCU). The `config.sample` script explains in detail how to write the configuration file (the file come from [here](https://github.com/mavlink-router/mavlink-router/blob/master/examples/config.sample)).

Once done with the installation, mavlink-router is enabled to run at startup, but it can be run for the current session with the command

```bash
sudo systemctl start mavlink-router.service
```

or by starting the daemon with the command

```bash
mavlink-routerd
```
