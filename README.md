![](https://badge.imagelayers.io/0xff/asmttpd.svg)

# asmttpd for Docker
based on:
- [nemasu/asmttpd](https://github.com/nemasu/asmttpd "nemasu/asmttpd")
- [library/alpine](https://registry.hub.docker.com/_/alpine/ "library/alpine")

### Basic usage

    docker run -p 8080:80 --name asmttpd -d 0xff/asmttpd
    curl http://localhost:8080/ # -> it works!

### Use custom content

    # go somwhere we can play...
    cd `mktemp -d`
    
    # download some random template (thanks bootstrapzero.com!)
    curl -o template.zip http://www.codeply.com/download/DRBmOoChfM
    unzip template.zip && rm template.zip
    
    # start it
    docker run -p 8888:80 --name asmttpd-site -d -v `pwd`:/var/www 0xff/asmttpd
    
    # point your browser to http://localhost:8888/
