# docker-curl-http2
Dockerfile to build a centos7 image that runs curl with http2 support.
To run this as a command use the following function
```
curl2 (){

docker run -it --rm mrbalonio/docker-curl-http2 "$@"
 }
curl2 --http2 -v  https://http2bin.org/get
```
