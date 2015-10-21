FROM advancedtelematic/java:8

RUN apt-get update \
 && apt-get install -y curl

ENV SBT_VERSION 0.13.8
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

COPY sbt-${SBT_VERSION}.sha /tmp/sbt-${SBT_VERSION}.sha

RUN cd /tmp \
 && curl -sL "https://dl.bintray.com/sbt/native-packages/sbt/${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" \
  > "sbt-${SBT_VERSION}.tgz" \
 && sha512sum -c sbt-${SBT_VERSION}.sha \
 && tar xzf sbt-${SBT_VERSION}.tgz -C /usr/local \
 && rm -f sbt-${SBT_VERSION}.{tgz,sha}

# fetch latest sbt
RUN sbt exit

WORKDIR /app
