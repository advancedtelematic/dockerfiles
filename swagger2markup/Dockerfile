FROM openjdk:8-jre-alpine

WORKDIR /usr/bin/swagger2markup

RUN apk update && \
  apk add ca-certificates wget && \
  update-ca-certificates && \
  wget https://jcenter.bintray.com/io/github/swagger2markup/swagger2markup-cli/1.3.1/swagger2markup-cli-1.3.1.jar

ENV JAVA_OPTS="-Dfile.encoding=UTF-8 -Dsun.jnu.encoding=UTF-8"

ENTRYPOINT ["java","-jar","/usr/bin/swagger2markup/swagger2markup-cli-1.3.1.jar","convert","-d","/usr/bin/swagger2markup","-i"]
