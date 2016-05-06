# alpine-mpd

This is an image for my favorite music server application [MPD](https://www.musicpd.org/). Using alpine as Cthe operating system.

This image is configured to use with Icecast as streaming output. You can edit the mpd.conf or use the fully audio stack I created. Check below about docker-music-stack.

Check [alpine-mpd](https://hub.docker.com/r/vitiman/alpine-mpd/), [alpine-icecast](https://hub.docker.com/r/vitiman/alpine-icecast/), [alpine-sima](https://hub.docker.com/r/vitiman/alpine-sima/) and [alpine-ympd](https://hub.docker.com/r/vitiman/alpine-ympd/).

# How to use 

You can create volumes for your music, playlists and/or database, or use host volumes instead, you need to replace `your_SOMETHING_volume` with your host path or own volume.

    docker run -d -p 6600:6600 \ 
        -v your_music_volume:/var/lib/mpd/music \
        -v your_playlists_volume:/var/lib/mpd/playlists \
        -v your_database_volume:/var/lib/mpd/database \
        --name mpd vitiman/alpine-mpd:latest


An instance of mpd is now running with the port 6600 mapped to your host or docker-machine IP address.

# Custom configuration 

Check the repository and you will find an `mpd.conf` you can edit and set your custom configuration. You just need to build the image again.

The passwords in the current configuration are just for testing purposes.

# Docker-music-stack

I've made a group of images for a full music-stack fully working.

- [mpd](http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki) My favorite music server application
- [icecast](http://icecast.org/): To stream the audio over the world
- [sima](http://kaliko.me/code/mpd-sima/): Autoqueue client. Never stop listen!
- [ympd](https://www.ympd.org/): A minimal Web GUI.

Check the [Github repository](https://github.com/VITIMan/docker-music-stack) or the rest of images in Docker Hub. There is a docker-compose to setup everything.

Enjoy!
