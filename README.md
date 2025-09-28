# raspi-setup-scripts-v2

On a base install of Raspberry OS this should:

- Update the system to latest packages
- Setup Samba file sharing with a share calle pishare (/home/shared/pishare)
- Install Docker
- Install Homepage in docker container
- Install Transmission in docker container
- Install Prowlarr in docker container
- Install Emby in docker container

### Ports

homepage      <http://hostname.local:3000/>
transmission  <http://hostname.local:9091/>
emby          <http://hostname.local:8096/>
prowlarr      <http://hostname.local:9696/>

### Installation

```

curl -L https://github.com/uglygus/raspi-setup-scripts-v2/archive/refs/heads/main.zip  --output raspi-setup-scripts.zip

unzip raspi-setup-scripts.zip

cd raspi-setup-scripts-v2-main

sh setup-1-system.sh

sh setup-2-samba.sh

sh setup-3-docker.sh

```

### Files

/home/shared/pishare/media/
/home/shared/pishare/media/movies
/home/shared/pishare/media/tv

## TODO

- Look into FlexGet
- Start with pre-populated config file. That wil be simplest. Rather than programmatically changing individual parts.
- add a comment to them.
