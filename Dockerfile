FROM base/archlinux:latest

MAINTAINER devnull@libcrack.so

RUN pacman -Syy --noconfirm && \
    echo -e "[extra]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf && \
    echo -e "[community]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf && \
    pacman -S --noconfirm archlinux-keyring && \
    pacman -S --noconfirm extra/c-ares core/curl community/unrealircd
    # pacman-db-upgrade

EXPOSE 6697
EXPOSE 7000

CMD ["/usr/bin/unrealircd","-F"]

