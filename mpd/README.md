# alpine-mpd

This is an image for my favorite music server application MPD. Using alpine as the operating system.

The idea is use this image together with a fully audio stack. Check below about docker-music-stack.

# How to use 

You can create volumes for your music, playlists and/or database, or use host volumes instead, you need to replace `your_SOMETHING_volume` with your host path or own volume.

    docker run -d -p 6600:6600 --net music_stack \ 
        -v your_music_volume:/var/lib/mpd/music \
        -v your_playlists_volume:/var/lib/mpd/playlists \
        -v your_database_volume:/var/lib/mpd/database \
        --name alpine-mpd alpine-mpd:dev

An instance of mpd is now running with the port 6600 mapped to your host.

# Custom configuration 

Check the github repository and you will find an `mpd.conf` you can edit and set your custom configuration. You just need to build the image again.

The passwords in the configuration are just for testing purposes.

# Docker-music-stack

I've made a group of images for a full music-stack fully working.

- [mpd](http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki)
- [icecast](http://icecast.org/): To stream the audio over the world
- [sima](http://kaliko.me/code/mpd-sima/): Autoqueue client. Never stop listen!
- [ympd](https://www.ympd.org/): A minimal Web GUI.

Check the repository or the rest of images in docker hub.

