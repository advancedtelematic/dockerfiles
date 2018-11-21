FROM haskell:8.4 as builder

RUN cabal update && cabal install dhall-json

FROM haskell:8.4

COPY --from=builder /root/.cabal/bin/ /root/.cabal/bin/

ENV PATH=$PATH:/root/.cabal/bin

WORKDIR /data
