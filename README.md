# rpi-privoxy
<a href="https://hub.docker.com/r/intrepidde/rpi-privoxy"><img src="https://img.shields.io/docker/pulls/intrepidde/rpi-privoxy.svg?style=plastic&logo=appveyor" alt="Docker pulls"/></a><br>
Raspberry Pi (RPi) Docker container with privoxy
(arm32v6 aka RPi A/B/B+ and later)

create a directoy

copy or create a privoxy.conf in the directory

mkdir log

docker run -d --restart=unless-stopped --name rpi-privoxy --hostname="" -v /privoxy.conf:/etc/privoxy/config:ro -v /log:/var/log/privoxy:rw -p : intrepidde/rpi-privoxy


1.0 based on armhf/alpine:3.4
1.1 based on arm32v6/alpine:latest
>3.0 based on arm32v6&alpine:latest and build with source from https://www.privoxy.org/sf-download-mirror/Sources (Tag/Version is used privoxy version)

https://github.com/FoxRomeo/rpi-privoxy https://www.intrepid.de/index.php/projects/git-docker/5-intrepidde-rpi-privoxy
