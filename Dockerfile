FROM ubuntu:24.04

RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
	&& rm -rf /var/lib/apt/lists/*

ENV LANG en_US.utf8

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y sudo git ansible vim bash fontconfig && rm -rf /var/lib/apt/lists/*

RUN useradd -M -s /bin/bash app && echo 'app:app' | chpasswd && echo "app ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Set working directory for the user
WORKDIR /app

# Run your application process as the non-privileged user
USER app
