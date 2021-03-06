FROM balenalib/armv7hf-ubuntu:bionic
MAINTAINER rodriguezst <github.com/rodriguezst>

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install -y --no-install-recommends \
                                python3 \
                                python3-dev \
                                python3-pip \
                                python3-setuptools \
                                python3-wheel \
                                build-essential \
                && rm -rf /var/lib/apt/lists/* \
                && pip3 install cryptg \
                && pip3 install telethon[cryptg] \
                && apt-get remove --purge -y build-essential \
                                python3-dev \
                && apt autoremove -y \
                && rm -rf /var/lib/apt/lists/*

RUN [ "cross-build-end" ]
