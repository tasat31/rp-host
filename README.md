## Redpitaya Host Environment

This is the cross-compile environment for Redpitaya application development

## Features

### Target(Redpitaya):

- Ubuntu16.04 based
- gcc version 5.4.0 20160609 (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4)

### Host(Ubuntu22.04):

- Architechture x86_64
- use docker arm32v7 for cross compile

In this case of Redpitaya, target ubuntu version 16.04 < host 22.04,
so docker is applied for cross compile tool.

#### Pre-required

- docker
- qemu-user-static

```
sudo apt install qemu-user-static
```

## Get Started

```
mkdir redpitaya-project-example
cd redpitaya-project-example
git clone git@github.com:tasat31/rp-host.git
cd rp-host
```

**HOST**
```
$ docker build -t redpitaya .
$ cd ..
$ docker run -it --rm -v ${PWD}:/src redpitaya

(In docker:example)
# cd /src
# gcc examples/hello.c -o hello
# exit

$ scp hello root@rp-xxxxx.local:.
$ ssh root@rp-xxxxx.local
```

!! It takes some long time to make cmake !!

**Target(Redpitaya)**
```
$ ./hello
Hello, world!
```

To use, librp.so
```
gcc -o blink -I/opt/redpitaya/include/redpitaya blink.c /opt/redpitaya/lib/librp.so  /opt/redpitaya/lib/librp.a
```

See https://redpitaya.readthedocs.io/en/latest/developerGuide/software/build/comC.html#compiling-and-running-c-applications

Don't forget to load FPGA image

```
cat /opt/redpitaya/fpga/fpga_0.94.bit > /dev/xdevcfg
```

### ToDo

- Embark and build redpitaya api to Docker

- Introduce hardware emulation
