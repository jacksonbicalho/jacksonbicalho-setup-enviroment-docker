FROM debian:bullseye-slim
RUN apt update && \
  apt dist-upgrade --yes && \
  apt install --yes \
  build-essential \
  binutils-dev \
  libssl-dev \
  libcurl4-openssl-dev \
  zlib1g-dev \
  libdw-dev \
  libiberty-dev \
  python3 \
  cmake \
  wget \
  git



RUN wget -O- https://git.io/shellspec | sh -s -- --yes --prefix /usr

RUN git config --global init.defaultBranch master && \
    git clone https://github.com/SimonKagstrom/kcov.git && \
        cd kcov && \
        mkdir build && \
        cd build && \
        cmake ..  && \
        make  && \
        make install

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

RUN useradd \
  --shell /usr/bin/zsh \
  --uid 1000 \
  test

WORKDIR /app


USER test

ENTRYPOINT ["docker-entrypoint"]
