# Unreal IRCd Arch linux docker container

[![](https://badge.imagelayers.io/libcrack/limnoria:latest.svg)](https://imagelayers.io/?images=libcrack/archlinux-unrealircd:latest 'hub.docker.com/u/libcrack/archlinux-unrealircd')

Build the image:

```bash
docker build -t archlinux-unrealircd .
```

Run the container:

```bash
docker run -d -p 6697:6697 -p 7000:7000 --name ircd archlinux-unrealircd
```

Alternatively, you can run the image pulling it directly from hub.docker.com:

```bash
docker run -d -p 6697:6697 -p 7000:7000 --name ircd libcrack/archlinux-unrealircd
```

