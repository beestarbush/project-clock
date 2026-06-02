FROM crops/poky:ubuntu-22.04

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    vim \
    wget \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN wget https://storage.googleapis.com/git-repo-downloads/repo -O /usr/bin/repo && \
    chmod a+x /usr/bin/repo
