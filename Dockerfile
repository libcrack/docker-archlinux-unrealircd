FROM archlinux:latest

MAINTAINER libcrack <libcrack@users.noreply.github.com>

RUN echo -e "[extra]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf && \
    pacman-key --init && \
    pacman-key --populate && \
    pacman-db-upgrade && \
    pacman -Syy --noconfirm && \
    pacman -S --noconfirm archlinux-keyring && \
    pacman -S --noconfirm core/curl extra/c-ares extra/unrealircd

EXPOSE 6697
EXPOSE 7000

CMD ["/usr/bin/unrealircd","-F"]
