# alpine-icecast

This is an image for the streaming application [Icecast](http://icecast.org/) using alpine as the operating system.

The idea is use this image together with a fully audio stack.  You can edit the icecast.xml or use the fully audio stack I created. Check below about docker-music-stack.

Check [alpine-mpd](https://hub.docker.com/r/vitiman/alpine-mpd/), [alpine-icecast](https://hub.docker.com/r/vitiman/alpine-icecast/), [alpine-sima](https://hub.docker.com/r/vitiman/alpine-sima/) and [alpine-ympd](https://hub.docker.com/r/vitiman/alpine-ympd/).

# How to use 

    docker run -p 8000:8000 --name=icecast -d vitiman/alpine-icecast:latest

An instance of icecast is now running with the port 8000 mapped to your host or docker-machine IP address.

# Custom configuration 

Check the github repository and you will find an `icecast.xml` you can edit and set your custom configuration. You just need to build the image again.

The passwords in the configuration are just for testing purposes.

# Docker-music-stack

I've made a group of images for a full music-stack fully working.

- [mpd](http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki) My favorite music server application
- [icecast](http://icecast.org/): To stream the audio over the world
- [sima](http://kaliko.me/code/mpd-sima/): Autoqueue client. Never stop listen!
- [ympd](https://www.ympd.org/): A minimal Web GUI.

Check the [Github repository](https://github.com/VITIMan/docker-music-stack) or the rest of images in Docker Hub. There is a docker-compose to setup everything.

Enjoy!
