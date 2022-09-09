FROM ubuntu:16.04

RUN apt-get update
RUN apt install -y gcc-arm-linux-gnueabihf
RUN apt install -y git cmake

# https://redpitaya.readthedocs.io/en/latest/developerGuide/software/build/ecosystem/ecosystem.html
# generic dependencies
RUN apt-get install -y make curl xz-utils
# U-Boot build dependencies
RUN apt-get install -y libssl-dev device-tree-compiler u-boot-tools
# secure chroot
RUN apt-get install -y schroot
# QEMU
RUN apt-get install -y qemu qemu-user qemu-user-static
