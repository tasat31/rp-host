## Redpitaya Host Environment

This is the cross-compile environment for Redpitaya application development

## Features

### Target(Redpitaya):

- Ubuntu16.04 based
- gcc version 5.4.0 20160609 (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4)

### Host(Ubuntu22.04):

- Architechture x86_64
- use gcc-arm-linux-gnueabihf for Cross Compile

In this case, target ubuntu version 16.04 < host 22.04,
so Docker is applied for cross compile tool.

## Get Started

**HOST**
```
$ docker build .
$ docker run -it --rm -v ${PWD}:/src image-id

(In docker)
# cd /src
# arm-linux-gnueabihf-gcc examples/hello.c -o hello
# exit

$ scp hello root@rp-xxxxx.local:.
$ ssh root@rp-xxxxx.local
```

**Target(Redpitaya)**
```
$ ./hello
Hello, world!
```

### ToDo

- Embark redpitaya api to Docker




