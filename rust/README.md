# advancedtelematic/rust

## Image tags

The Docker images are tagged in the following format: `advancedtelematic/rust:${arch}-${rustc-version}`. The following architechture types are available: `x86`, `armel`, `armhf`. The latest tag will point to `x86-stable`, which will be updated as new versions of the rust compiler are released.

## Cross-compilation

In the project source-code directory, run:

```
  docker run --rm \
    --volume $(pwd):/src \
    advancedtelematic/rust:$TAG \
    cargo build --release --target=$TARGET
```

where `TAG` is set to [the format specified above](#image-tags) (or omit the tag entirely to use latest).

Set the `TARGET` environment variable to one of the following:

```
x86_64-unknown-linux-gnu
arm-unknown-linux-gnueabi
arm-unknown-linux-gnueabihf
armv7-unknown-linux-gnueabihf
```

### Additional targets

View a complete list of the available targets with `rustup target list`. After installing a new one, tell Cargo what linker to use by adding a new config section (at `/root/.cargo/config` by default). For example:

``
[target.armv7-unknown-linux-gnueabihf]
linker = "/usr/bin/arm-linux-gnueabihf-gcc"
``

## Share host Cargo cache

You can share your host Cargo cache to avoid re-downloading the same packages with:

```
  docker run --rm -it \
    --volume ~/.cargo/git:/root/.cargo/git \
    --volume ~/.cargo/registry:/root/.cargo/registry \
    --volume $(pwd):/src \
    advancedtelematic/rust
    cargo build --release --target=$TARGET
```
