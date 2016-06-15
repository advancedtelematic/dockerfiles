# Haskell-stack dockerfile

Creates an image with [`stack`](http://docs.haskellstack.org/en/stable/README/) installed.

## Build

To build, run:

```
cd haskell-stack
docker build -t advancedtelematic/haskell-stack:1.0.2 .
```

## Usage

This needs `stack setup` to be run and persisted between calls, so first up run the following:

```
docker create --name stack-cache -v /root/.stack tianon/true /bin/true 2>/dev/null || true'
```

Then use that volume for the rest of the calls like so:

```
docker run -v "$(pwd):/src" --volumes-from stack-cache advancedtelematic/haskell-stack stack
```

The `WORKDIR` is `/src`, so link the code you want to build in there and then you can call `stack` on it.
