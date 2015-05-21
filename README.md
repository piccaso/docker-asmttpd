# asmttpd for Docker
based on:

- [nemasu/asmttpd](https://github.com/nemasu/asmttpd "nemasu/asmttpd") - the server
- [library/alpine](https://registry.hub.docker.com/_/alpine/ "library/alpine") - for building

![](https://badge.imagelayers.io/0xff/asmttpd.svg)

### Basic usage
```sh
docker run -p 8080:80 --name asmttpd -d 0xff/asmttpd
curl http://localhost:8080/ # -> it works!
```

### Use custom content
```sh
# go somwhere we can play...
cd `mktemp -d`

# download some random template (thanks bootstrapzero.com!)
curl -o template.zip http://www.codeply.com/download/DRBmOoChfM
unzip template.zip && rm template.zip

# start it
docker run -p 8888:80 --name asmttpd-site -d -v `pwd`:/var/www 0xff/asmttpd

# point your browser to http://localhost:8888/
```

### Building
Optional, image available on [Docker Hub](https://registry.hub.docker.com/u/0xff/asmttpd/ "Docker Hub").

```sh
# build filesystem
build/build.sh

# build image
docker build -t 0xff/asmttpd tiny
```