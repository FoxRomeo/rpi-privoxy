FROM arm32v6/alpine:latest
MAINTAINER docker@intrepid.de

RUN apk --update --no-cache add privoxy bash

# expose http port 
#EXPOSE 3128

# copy in our privoxy config file 
#COPY privoxy.conf /etc/privoxy/config

# make sure files are owned by privoxy user 
USER privoxy
RUN chown -R privoxy /var/log/privoxy

# if --no-daemon is set log output is sdterr and not the logfile
CMD /usr/sbin/privoxy --no-daemon /etc/privoxy/config &> /var/log/privoxy/privoxy.log
