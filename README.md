Firefox
=======

Unofficial build of Firefox running within a docker container and rendered by the local X Server.

Launch Command
---------------
```
docker run -v $HOME/Downloads:/home/firefox/Downloads:rw -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd --privileged -e uid=$(id -u) -e gid=$(id -g) -e DISPLAY=unix$DISPLAY --name firefox chrisdaish/firefox
```
Additional config example:

```
docker run  -v $HOME/<pathToConfigFiles>/xulstore.json:/home/firefox/.mozilla/firefox/xulstore.json:ro \
            -v $HOME/<pathToConfigFiles>/bookmarks.json:/home/firefox/.mozilla/firefox/bookmarkbackups/bookmarks-2015-03-30.json:ro \
            -v $HOME/<pathToConfigFiles>/mozilla.cfg:/usr/lib/firefox/mozilla.cfg:ro \
            -v $HOME/<pathToConfigFiles>/local-settings.js:/usr/lib/firefox/defaults/pref/local-settings.js:ro \
            -v $HOME/Downloads:/home/firefox/Downloads:rw \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v /dev/snd:/dev/snd \
            -e uid=$(id -u) \
            -e gid=$(id -g) \
            -e DISPLAY=unix$DISPLAY \
            -e URL=http://www.docker.com \
            --privileged \
            --name firefox \
            chrisdaish/firefox
```

FAQ
---
Note: If you receive the following Gtk error:

```
Gtk-WARNING **: cannot open display: unix:0.0
```
Simply allow the docker user to communicate with your X session

```
xhost +local:docker
```
