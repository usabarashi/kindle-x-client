FROM ubuntu:jammy-20221130

ENV DISPLAY host.docker.internal:0
COPY KindleForPC-installer-1.39.65383.exe /root/KindleForPC.exe
COPY setup.sh /root/setup.sh

RUN apt update -y \
    &&  apt install -y wget \
    && dpkg --add-architecture i386 \
    && wget -O /etc/apt/sources.list.d/winehq-jammy.sources https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources \
    && mkdir -pm755 /etc/apt/keyrings \
    && wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key \
    && apt update -y \
    && apt install --install-recommends -y winehq-stable \
    && apt install -y winetricks zenity fonts-ipafont-gothic \
    && winetricks --self-update \
    && winetricks cjkfonts \
    && chmod +x /root/setup.sh \
    && /root/setup.sh

CMD wine /root/.wine/drive_c/Program\ Files\ \(x86\)/Amazon/Kindle/Kindle.exe