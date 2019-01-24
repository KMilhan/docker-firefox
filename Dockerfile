FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

RUN useradd -m firefox; \    
    apt-get update; \
    apt-get install -y --no-install-recommends  firefox \
                                                dbus-x11 \
                                                libxext-dev \
                                                libxrender-dev \
                                                libxtst-dev\
                                                fonts-noto-cjk \
                                                fonts-noto-cjk-extra \
                                                curl \
                                                wget \
                                                emacs-nox ; \
    rm -rf /var/lib/apt/lists/*

COPY start-firefox.sh /tmp/
RUN chmod 0755 /tmp/start-firefox.sh 

ENTRYPOINT ["/tmp/start-firefox.sh"]
