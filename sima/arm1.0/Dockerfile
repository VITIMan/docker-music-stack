FROM container4armhf/armhf-alpine:3.3
MAINTAINER @VITIMan https://github.com/VITIMan 

ENV SIMA_VERSION 0.14.1
ENV PYTHON_VERSION 3.5.1-r0

RUN apk -q update \
    && apk -q --no-progress add python3="$PYTHON_VERSION" \
    && apk -q --no-progress add curl

RUN curl -fsSl http://media.kaliko.me/src/sima/releases/MPD_sima-$SIMA_VERSION.tar.xz -o sima.tar.xz \
    && tar -xJf sima.tar.xz \
    && sed -i 's,https://raw.github.com/pypa/pip/master/contrib/get-pip.py,https://bootstrap.pypa.io/get-pip.py,g' MPD_sima-$SIMA_VERSION/vinstall.py \
    && rm -rf sima.tar.xz \
    && python3 MPD_sima-$SIMA_VERSION/vinstall.py \
    && apk -q --no-progress del curl \
    && rm -rf /var/cache/apk/*

COPY sima.conf /MPD_sima-$SIMA_VERSION/sima.conf
WORKDIR MPD_sima-$SIMA_VERSION

CMD ["./vmpd-sima", "-c", "sima.conf"]
