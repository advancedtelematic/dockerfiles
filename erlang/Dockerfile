FROM debian:8
ENV DEBIAN_FRONTEND noninteractive
ENV REFRESHED_AT 2015_07_23

# install dependencies for erlang
RUN echo 'deb-src http://http.debian.net/debian stable main' >> /etc/apt/sources.list; \
    echo 'deb-src http://http.debian.net/debian stable-updates main' >> /etc/apt/sources.list; \
    apt-get update; \
    apt-get install -y wget build-essential; \
    apt-get build-dep -y erlang

# install glibc >=2.14
RUN echo 'deb http://http.debian.net/debian testing main' >> /etc/apt/sources.list; \
    apt-get update; \
    apt-get -t testing install -y libc6-dev

# Build erlang 17.5
ADD md5sums /tmp/md5sums
RUN cd /tmp && \
    wget -q http://www.erlang.org/download/otp_src_17.5.tar.gz && \
    md5sum -c md5sums && \
    tar xzvf otp_src_17.5.tar.gz && \
    cd otp_src_17.5 && \
    ./configure && make && make install

RUN rm -rf /tmp/{otp_src_17.5.tar.gz,otp_src_17.5}

