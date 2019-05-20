FROM alpine

ENV \
  BUILD_DEPS="gcc musl-dev python2-dev musl-dev gcc openssl-dev libffi-dev openssl-dev" \
  ELASTALERT_DIR=/opt/elastalert \
  ELASTALERT_CONFIG=/opt/elastalert/config.yaml \
  ELASTALERT_INDEX=elastalert_status

RUN apk add --no-cache ca-certificates openssl python2 py2-pip libmagic tzdata $BUILD_DEPS \
  && cp /usr/share/zoneinfo/UTC /etc/localtime \
  && echo "UTC" > /etc/timezone

RUN pip install "elastalert>=0.2.0b" "urllib3<1.25,>=1.20"

RUN \
  apk del $BUILD_DEPS && \
  rm -rf /var/cache/apk/*

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR $ELASTALERT_DIR

ENTRYPOINT /entrypoint.sh
