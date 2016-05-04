# alpine-icecast

This is an image for the streaming application [Icecast](http://icecast.org/) using alpine as the operating system.

The idea is use this image together with a fully audio stack. Check below about docker-music-stack.

# How to use 

    docker run -p 8000:8000 --name=icecast -d alpine-icecast:dev

An instance of icecast is running, right now.

# Custom configuration 

Check the github repository and you will find an `icecast.xml` you can edit and set your custom configuration. You just need to build the image again.

The passwords in the configuration are just for testing purposes.

# Docker-music-stack

I've made a group of images for a full music-stack fully working.

- [mpd](http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki)
- [icecast](http://icecast.org/): To stream the audio over the world
- [sima](http://kaliko.me/code/mpd-sima/): Autoqueue client. Never stop listen!
- [ympd](https://www.ympd.org/): A minimal Web GUI.

Check the repository or the rest of images in docker hub

