FROM alpine:3.7

RUN apk add --no-cache --update curl python git openssh bash gnupg && \
    curl -Lo repo https://storage.googleapis.com/git-repo-downloads/repo && \
    chmod a+x repo && \
    mv repo /usr/bin

WORKDIR /src

ENTRYPOINT ["repo"]
