#!/bin/bash

#https://www.privoxy.org/
#<p>The most recent release is <a href="announce.txt" target="_top">3.0.28 (stable)</a>.</p>
VERSION=`curl -s "https://www.privoxy.org/" | grep 'The most recent release is ' | sed -n -e s~'^.*<a href="announce.txt" target="_top">'~~p | sed -n -e s~' (stable)</a>.</p>.*$'~~p`

echo ${VERSION}