FROM alpine:3.3
MAINTAINER @VITIMan https://github.com/VITIMan 

ENV NCMPCPP_VERSION 0.7.3

RUN buildDeps="curl curl-dev g++ make fftw-dev taglib-dev autoconf automake libtool boost-dev icu-dev libmpdclient-dev readline-dev ncurses-dev" \
    && set -x  \
    && apk add -q --no-progress --update $buildDeps \
    && curl -fsSlL https://github.com/arybczak/ncmpcpp/archive/$NCMPCPP_VERSION.tar.gz  -o ncmpcpp.tar.gz \
    && tar -xzf ncmpcpp.tar.gz \
    && rm -rf ncmpcpp.tar.gz \
    # https://github.com/arybczak/ncmpcpp/issues/19
    # https://github.com/arybczak/ncmpcpp/issues/39
    && cd ncmpcpp-$NCMPCPP_VERSION; BOOST_LIB_SUFFIX=\"-mt\" ./configure CFLAGS=\'-D_XOPEN_SOURCE=500\' CXXFLAGS=\'-D_XOPEN_SOURCE=500\' \
    && cd ncmpcpp-$NCMPCPP_VERSION; make \
    && cd ncmpcpp-$NCMPCPP_VERSION; make install \
 	&& apk del --purge $buildDeps \
 	&& rm -rf /var/cache/apk/* \
    ;

COPY ncmpcpp.conf /etc/ncmpcpp.conf

CMD ["ncmpcpp", "-c", "/etc/ncmpcpp.conf"]
