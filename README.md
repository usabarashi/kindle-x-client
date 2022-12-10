# Kindle X Client

Draw a Kindle application from an X Client in a Docker container to a macOS X Server using the X Window System. X Server and Docker container execution environment are prerequisites.

# Build x window client

1. Download Kindle for PC. [Use the Kindle app to start reading from your PC or Mac](https://www.amazon.com/gp/help/customer/display.html?nodeId=GZSM7D8A85WKPYYD).
1. Place the installer so that it is included at build time.
1. Build with the following command.
    ```
    $ docker build . -t usabarashi/kindle-x-client
    ```
1. Install additional libraries required to run wine by screen operation.
1. Exit the application without setting anything on the kindle startup screen.

# Build a host application

1. Launch Automator.
1. Select Application.
1. Select Run Shell Script.
1. Paste the following script.
    ```shell
    #! /bin/zsh
    PATH=/usr/local/bin:$PATH
    docker run \
        --rm \
        --net host \
        --shm-size=2gb \
        --env DISPLAY=host.docker.internal:0 \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /Users/`whoami`/Documents/Kindle:/root/.wine/drive_c/users/root/AppData/Local/Amazon/Kindle \
        usabarashi/kindle-x-client
    ```
1. Save in application format.

# Run

Runs applications built with Automator

# References

- [Use the Kindle app to start reading from your PC or Mac](https://www.amazon.com/gp/help/customer/display.html?nodeId=GZSM7D8A85WKPYYD)
- [X Window System](https://en.wikipedia.org/wiki/X_Window_System)
- [HomeBrew Formulae XQuartz](https://formulae.brew.sh/cask/xquartz)
- [DockerDesktop](https://docs.docker.com/desktop/install/mac-install/)
- [WineHQ](https://www.winehq.org/)
- [How to install WineHQ on Ubuntu 22.04 LTS Jammy](https://www.how2shout.com/linux/how-to-install-winehq-on-ubuntu-22-04-lts-jammy/)
- [Automator User Guide](https://support.apple.com/guide/automator/welcome/mac)