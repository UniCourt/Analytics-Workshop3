FROM python:3.9-alpine3.15
WORKDIR /mysite
COPY ./mysite/requirements.pip /requirements.pip
RUN apk update \
    && apk upgrade busybox zlib \
    && apk add libpq libpq-dev gcc musl-dev make expat-dev\
    && pip3 install -r /requirements.pip\
    && apk del gcc musl-dev make libpq-dev expat-dev\
    && rm -rf /var/cache/apk/*  /root/.cache/*
COPY /mysite /mysite
