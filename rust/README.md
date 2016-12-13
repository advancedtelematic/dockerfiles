# advancedtelematic/rust

## Image tags

The Docker images are tagged in the following format: `advancedtelematic/rust:${arch}-${rustc-version}`.

The following architechture types are available: `x86`, `armel`, `armhf`. By default, the latest tag will point to `x86-stable`.

## Cross-compilation

Set the TARGET environment variable to one of:

```
x86_64-unknown-linux-gnu
x86_64-unknown-linux-musl
arm-unknown-linux-gnueabi
arm-unknown-linux-gnueabihf
armv7-unknown-linux-gnueabihf
```

Then, in the project source-code directory, run:

`docker run --rm -v $(pwd):/src advancedtelematic/rust:$TAG cargo build --release --target=$TARGET`

where `$TAG` matches the relevant [image tag](#image-tags).

### Additional targets

View a complete list of the available targets with `rustup target list`. After installing a new one, tell Cargo what linker to use by adding a new config section (to `/root/.cargo/config` by default):

``
[target.armv7-unknown-linux-gnueabihf]
linker = "/usr/bin/arm-linux-gnueabihf-gcc"
``

## Share host Cargo cache

Ensure your local Cargo config file has the correct linker paths set up as above, then start a rust container with:

```
  docker run --rm -it \
    --env CARGO_HOME=/cargo \
    --volume ~/.cargo:/cargo \
    --volume $(pwd):/src \
    advancedtelematic/rust
```
