FROM ubuntu:noble

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get full-upgrade && \
    apt-get install -y \
    bash \
    bc \
    binutils \
    bison \
    build-essential \
    bzip2 \
    cpio \
    debianutils \
    diffutils \
    file \
    findutils \
    flex \
    g++ \
    gcc \
    git \
    gzip \
    libdevmapper-dev \
    libfdt-dev \
    libncurses5-dev \
    libssl-dev \
    libsystemd-dev \
    locales \
    make \
    mercurial \
    nano \
    patch \
    perl \
    python3 \
    rsync \
    sed \
    tar \
    unzip \
    vim \ 
    wget \
    whois

RUN locale-gen en_US.utf8

RUN git clone git://git.buildroot.net/buildroot \
    --depth=1 \
    --branch=2024.02.x \
    /root/buildroot

WORKDIR /root/buildroot

# Add more external trees with
# 'run.sh make BR2_EXTERNAL=/path/to/tree1:/path/to/tree2 menuconfig'
ENV BR2_EXTERNAL=/root/buildroot/external/snapos/buildroot-external

# This is for allowing root to run buildroot.
ENV FORCE_UNSAFE_CONFIGURE=1

RUN ["/bin/bash"]