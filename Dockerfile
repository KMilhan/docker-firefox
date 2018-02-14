FROM ubuntu:latest

MAINTAINER Chris Daish <chrisdaish@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

COPY AptSources /etc/apt/sources.list.d/


RUN useradd -m firefox; \    
    apt-get update; \
    apt-get install -y --no-install-recommends  firefox \
                                                dbus-x11 \
                                                adobe-flashplugin \
                                                libxext-dev \
                                                libxrender-dev \
                                                libxtst-dev; \
    rm -rf /var/lib/apt/lists/*

COPY start-firefox.sh /tmp/
RUN chmod 0755 /tmp/start-firefox.sh 

ENTRYPOINT ["/tmp/start-firefox.sh"]
