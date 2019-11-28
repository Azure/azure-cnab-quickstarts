## Pre-requisites

In order to use this bundle, you must first prepare your Raspberry Pi device.

Note - this bundle has been tested with Raspberry Pi 4.

- Flash Raspbian Lite onto SD (balanaEtcher)
- Add ssh and wpa-config
- `ssh pi@raspberrypi`
- `sudo raspbi-config`
    - Update password
    - Update hostname
    - Reboot
- `ssh pi@<hostname> mkdir ~/.ssh`
- `scp <user-directory>\.ssh\id_rsa.pub pi@<hostname>:~\.ssh\authorized_keys`