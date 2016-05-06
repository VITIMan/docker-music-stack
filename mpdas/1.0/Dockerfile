FROM alpine:3.3
MAINTAINER @VITIMan https://github.com/VITIMan 

ENV MPDAS_VERSION 0.4.1

# TODO libcurl not found

# Release download alternatives
# https://github.com/hrkfdn/mpdas/archive/$MPDAS_VERSION.tar.gz
# http://50hz.ws/mpdas/mpdas-$MPDAS_VERSION.tar.gz
RUN buildDeps="curl curl-dev g++ make libmpdclient-dev libmpdclient" \
    && set -x  \
    && apk add -q --no-progress --update $buildDeps \
    && curl -fsSlL  https://github.com/hrkfdn/mpdas/archive/$MPDAS_VERSION.tar.gz -o mpdas.tar.gz \
    && tar -xzf mpdas.tar.gz \
    && rm -rf mpdas.tar.gz

WORKDIR /mpdas-$MPDAS_VERSION

# Make and cleanup
RUN make \
    && make install \
 	&& apk del --purge $buildDeps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /mpdas-$MPDAS_VERSION

WORKDIR /

COPY mpdasrc /usr/local/etc/mpdasrc

CMD ["mpdas"]
