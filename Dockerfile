FROM arm32v7/ubuntu:16.04

RUN apt update
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

# set up ld path
RUN mkdir -p /opt/redpitaya/lib
RUN echo "/opt/redpitaya/lib" > /etc/ld.so.conf.d/redpitaya.conf
RUN mkdir -p /opt/redpitaya/include/redpitaya
RUN ldconfig

RUN curl -OL https://github.com/Kitware/CMake/releases/download/v3.24.1/cmake-3.24.1.tar.gz
RUN tar zxf cmake-3.24.1.tar.gz
WORKDIR cmake-3.24.1
RUN ./bootstrap
RUN make
RUN make install
