TODO: Write up pre-requisites and instructions here

- Flash Raspbian Lite onto SD (balanaEtcher)
- Add ssh and wpa-config
- `ssh pi@raspberrypi`
- `sudo raspbi-config`
    - Update password
    - Update hostname
    - Reboot
- `ssh pi@<hostname> mkdir ~/.ssh`
- `scp <user-directory>\.ssh\id_rsa.pub pi@<hostname>:~\.ssh\authorized_keys`