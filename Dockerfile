FROM ubuntu:16.04

RUN apt-get update
RUN apt install -y gcc-arm-linux-gnueabihf
