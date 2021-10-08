FROM Ubuntu:18.04

# Ref:
# https://docs.google.com/spreadsheets/d/1PmsqufkF3wjKN6g1L0STS80yP4a6u-VdGiEv5uOHe0M/htmlview

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV TZ Asia/Tokyo
ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

RUN apt-get update \
    eval "echo 'APT::Install-'"{Recommend,Suggest}"'s \"0\";';" \
    > /etc/apt/apt.conf.d/01norecommend \
    && apt-get install -y \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    gcc \
    gnupg \
    git \
    software-properties-common \
    unzip \
    xz-utils \
    zip

# clean up
RUN rm -rf /tmp \
    && apt-get autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*
