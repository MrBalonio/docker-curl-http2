FROM centos:centos7
RUN yum -y groupinstall "Development Tools"
RUN yum -y install libev libev-devel zlib zlib-devel openssl openssl-devel git
RUN cd /var/tmp && \
git clone https://github.com/tatsuhiro-t/nghttp2.git && \
cd nghttp2 && \
autoreconf -i && \
automake && \
autoconf && \
./configure && \
make && \
make install && \
echo '/usr/local/lib' > /etc/ld.so.conf.d/custom-libs.conf && \
ldconfig && \
ldconfig -p| grep libnghttp2
RUN cd /var/tmp && \
git clone https://github.com/bagder/curl.git && \
cd curl && \
./buildconf && \
./configure --with-nghttp2=/usr/local && \
make && \
make install
RUN cp /var/tmp/curl/src/curl /usr/local/bin
CMD ["-h"]
ENTRYPOINT ["/usr/local/bin/curl"]