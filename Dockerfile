FROM arm32v6/alpine:latest
MAINTAINER docker@intrepid.de

ENV PRIVOXYVERSION=<<PRIVOXYVERSION>>

RUN passwd -l root ; \
    apk --update --upgrade --no-cache add \
      bash \
      alpine-sdk \
      autoconf \
      pcre \
      pcre-dev \
      zlib \
      zlib-dev \
      openssl \
      openssl-dev && \
    addgroup \
      -S -g 1000 \
      privoxy && \
    adduser \
      -S -H -D \
      -h /home/privoxy \
      -s /bin/bash \
      -u 1000 \
      -G privoxy \
      privoxy && \
    passwd -l privoxy ; \
    mkdir /usr/src && \
    cd /usr/src && \
    wget "https://www.privoxy.org/sf-download-mirror/Sources/${PRIVOXYVERSION}%20%28stable%29/privoxy-${PRIVOXYVERSION}-stable-src.tar.gz" && \
    tar xzvf privoxy-${PRIVOXYVERSION}-stable-src.tar.gz && \
    cd privoxy-${PRIVOXYVERSION}-stable && \
    autoheader && \
    autoconf && \
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-compression && \
    make && \
    make install && \
    cd / && \
    rm -rf /usr/src ; \
    chown -R privoxy:privoxy /var/log/privoxy ; \
    apk del alpine-sdk zlib-dev openssl-dev pcre-dev autoconf ; \
    mkdir -p /etc/privoxy ; \
    mkdir -p /var/log/privoxy


# expose http port 
EXPOSE 3128

# copy in our privoxy config file 
#COPY privoxy.conf /etc/privoxy/config

# make sure files are owned by privoxy user 
USER privoxy

# if --no-daemon is set then log output is stderr and not the logfile
#CMD /usr/sbin/privoxy --no-daemon /etc/privoxy/config &> /var/log/privoxy/privoxy.log
CMD ["/usr/sbin/privoxy", "--no-daemon", "/etc/privoxy/config"]

