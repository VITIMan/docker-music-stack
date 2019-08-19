FROM library/alpine:3.10.1
MAINTAINER @VITIMan https://github.com/VITIMan 

ENV SIMA_VERSION 0.15.1
ENV PYTHON_VERSION 3.7.3-r0

RUN apk -q update \
    && apk -q --no-progress add python3="$PYTHON_VERSION" \
    && apk -q --no-progress add curl

RUN curl -fsSl https://gitlab.com/kaliko/sima/-/archive/$SIMA_VERSION/sima-$SIMA_VERSION.tar.gz -o sima.tar.gz \
    && tar -zxf sima.tar.gz \
    && sed -i 's,https://raw.github.com/pypa/pip/master/contrib/get-pip.py,https://bootstrap.pypa.io/get-pip.py,g' sima-$SIMA_VERSION/vinstall.py \
    && rm -rf sima.tar.gz \
    && python3 sima-$SIMA_VERSION/vinstall.py \
    && apk -q --no-progress del curl \
    && rm -rf /var/cache/apk/*

COPY sima.conf /sima-$SIMA_VERSION/sima.conf
WORKDIR sima-$SIMA_VERSION

CMD ["./vmpd-sima", "-c", "sima.conf"]
