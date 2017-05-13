# Build:
# docker build -t web .
#
# Run:
# docker run -it web
#
# Compose:
# docker-compose up -d

FROM nginx:latest
MAINTAINER Adebayo Adejare

# 80 = HTTP, 443 = HTTPS
EXPOSE 80

# Install Utilities
RUN apt-get update -q  \
 && apt-get install -yqq \
 curl \
 git \
 ssh \
 gcc \
 make \
 build-essential \
 libkrb5-dev \
 sudo \
 apt-utils \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install -yq nodejs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Prerequisites
RUN npm install --quiet