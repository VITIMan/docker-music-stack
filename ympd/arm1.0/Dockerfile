FROM container4armhf/armhf-alpine:3.3
MAINTAINER @VITIMan 

# docker run -p 8080:8080 --net music_stack --name=ympd -d alpine-ympd:dev

ENV YMPD_VERSION 1.3.0

ENV LIBMPDCLIENT_INCLUDE_DIR /usr/lib/libmpdclient.so.2

RUN apk -q update \
    && apk -q --no-progress add curl \
    && apk -q --no-progress add cmake \
    && apk -q --no-progress add libmpdclient \
    && apk -q --no-progress add gcc \
    && apk -q --no-progress add g++ \
    && apk -q --no-progress add libmpdclient-dev \
    && apk -q --no-progress add openssl-dev \
    && apk -q --no-progress add make


RUN curl -fsSlL https://github.com/notandy/ympd/archive/v$YMPD_VERSION.tar.gz -o ympd.tar.gz \
    && tar -xzf ympd.tar.gz \
    && mkdir ympd-$YMPD_VERSION/build

WORKDIR ympd-$YMPD_VERSION/build

RUN cmake .. -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    && make \
    && make install 

RUN apk -q --no-progress del cmake gcc g++ openssl-dev libmpdclient-dev curl \
    && rm -rf /var/cache/apk/*
 
EXPOSE 8080

CMD ["ympd", "-h", "mpd", "-p", "6600", "-w", "8080"]
