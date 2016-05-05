# Docker Music Stack

This a ready, set and deploy music stack built under docker.

## Applications used in the stack

- [mpd](http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki): My favorite 
music server application
- [icecast](http://icecast.org/): To stream the audio over the world
- [sima](http://kaliko.me/code/mpd-sima/): Autoqueue client. Never stop listen!
- [ympd](https://www.ympd.org/): A minimal Web GUI.
- More incoming...

MPD + Icecast would be the essential configuration to be prepared to listen music.
The other apps are cool add-ons for a beautiful stack

## Execution

You have two options to execute all the stack, using [docker-compose](https://docs.docker.com/compose/) or
launching the containers one-by-one, your choice. 

The default access to applications are:

- mpd: `http://localhost:6600` or `http://docker_machine_ip:6600`
- icecast streaming: `http://localhost:8000/mpd` or `http://docker_machine_ip:8000/mpd`
- ympd gui: `http://localhost:8080` or `http://docker_machine_ip:8080`

### Docker Compose

Clone this repo. **Edit docker-compose.yml** and add your host volumes for your music, playlists and/or database, then:

    docker-compose up -d

### Container by container, separatelly

1. Create a bridge network

    docker network create -d bridge music_stack

2. Run Icecast

    docker run -p 8000:8000 --net music_stack --name=icecast -d vitiman/alpine-icecast:latest

3. Run MPD

Use [host volumes](https://docs.docker.com/engine/userguide/containers/dockervolumes/#mount-a-host-directory-as-a-data-volume) or create your own volumes for your music, playlists and/or database

    docker run -d -p 6600:6600 --net music_stack \ 
        -v your_music_volume:/var/lib/mpd/music \
        -v your_playlists_volume:/var/lib/mpd/playlists \
        -v your_database_volume:/var/lib/mpd/database \
        --name mpd vitiman/alpine-mpd:latest

4. (Optional) Run sima

    docker run --net music_stack --name=sima -d vitiman/alpine-sima:latest

5. (Optional) Run ympd

    docker run -p 8080:8080 --net music_stack --name=ympd -d vitiman/alpine-ympd:latest

## Passwords, users and credentials

It's strongly recommended to change passwords in icecast.xml and mpd.conf.

The passwords in configuration are setted for development purposes.

## Configurations

- icecast.xml: default configuration for icecast.
- mpd.conf: basic configuration for mpd, using shoutcast stream
- sima.conf: basic configuration for sima autoqueuing

## Custom build

When you set up your current passwords, you need only to build using docker-compose 
with the other YAML file docker-compose.yml.custom. Don't forget to set your
volumes!

    docker-compose -f docker-compose.yml.custom build
    docker-compose -f docker-compose.yml.custom up -d

## DockerHub repository

- [alpine-mpd](https://hub.docker.com/r/vitiman/alpine-mpd/) 
- [alpine-icecast](https://hub.docker.com/r/vitiman/alpine-icecast/) 
- [alpine-sima](https://hub.docker.com/r/vitiman/alpine-sima/) 
- [alpine-ympd](https://hub.docker.com/r/vitiman/alpine-ympd/).

## TODOs

- [ ] Template version for docker compose
- [ ] Capture sima and ympd SIGTERM signal to stop quickly the container
- [ ] Some permissions inside containers
