FROM archlinux:latest

MAINTAINER libcrack <libcrack@users.noreply.github.com>

RUN echo -e "[extra]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf && \
    echo -e "[community]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf && \
    pacman-key --init && \
    pacman-key --populate && \
    pacman-db-upgrade && \
    pacman -Syy --noconfirm && \
    pacman -S --noconfirm archlinux-keyring && \
    pacman -S --noconfirm extra/c-ares core/curl community/unrealircd

RUN groupadd unrealirc && \
    useradd -m -r -g unrealirc -d /home/unrealirc \
      -s /sbin/nologin -c "Unreal IRCd User" unrealirc
      
USER unrealirc

WORKDIR /home/unrealirc

EXPOSE 6697
EXPOSE 7000

CMD ["/usr/bin/unrealircd","-F"]
