FROM ubuntu:16.04

RUN apt -y update
RUN apt install -y gcc-arm-linux-gnueabihf
RUN apt install -y gcc g++
RUN apt install -y git


# https://redpitaya.readthedocs.io/en/latest/developerGuide/software/build/ecosystem/ecosystem.html
# generic dependencies
RUN apt install -y make curl xz-utils
# U-Boot build dependencies
RUN apt install -y libssl-dev device-tree-compiler u-boot-tools
# secure chroot
RUN apt install -y schroot
# QEMU
RUN apt install -y qemu qemu-user qemu-user-static
# RUN apt-get install lib32z1 lib32ncurses5 libbz2-1.0:i386 lib32stdc++6
RUN apt install -y lib32z1 lib32ncurses5 lib32stdc++6

# Update cmake
RUN apt remove -y cmake
RUN curl -OL https://github.com/Kitware/CMake/releases/download/v3.24.1/cmake-3.24.1-linux-x86_64.tar.gz
RUN tar zxf cmake-3.24.1-linux-x86_64.tar.gz
RUN cp cmake-3.24.1-linux-x86_64/bin/* /usr/bin
RUN cp -r cmake-3.24.1-linux-x86_64/share/* /usr/share
RUN rm -r cmake-3.24.1-linux-x86_64/
RUN rm cmake-3.24.1-linux-x86_64.tar.gz

# set up ld path
RUN mkdir -p /opt/redpitaya/lib
RUN echo "/opt/redpitaya/lib" > /etc/ld.so.conf.d/redpitaya.conf
RUN ldconfig

RUN mkdir -p /opt/redpitaya/include
