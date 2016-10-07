FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y build-essential git cmake pkg-config \
       libbz2-dev libstxxl-dev libstxxl1v5 libxml2-dev \
       libzip-dev libboost-all-dev lua5.2 liblua5.2-dev libluabind-dev libtbb-dev

RUN git clone https://github.com/Project-OSRM/osrm-backend.git /osrm-backend
WORKDIR /osrm-backend

RUN mkdir -p build
RUN cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    cmake --build . && \
    cmake --build . --target install
RUN cp build/osrm-routed /usr/bin/
RUN cp build/osrm-extract /usr/bin/
RUN cp build/osrm-contract /usr/bin/
RUN cp build/osrm-datastore /usr/bin/

VOLUME ["/var/lib/osrm/data"]

EXPOSE 5000
ENTRYPOINT ["/usr/bin/osrm-routed", "/var/lib/osrm/data/map.osrm"]
