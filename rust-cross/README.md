# rust-cross

## Cross compiling to ARM

Start a rust-cross container in the project source-code directory with:

`docker run --rm -it --volume $(pwd):/src advancedtelematic/rust-cross`

then compile a release build for the ARM target with:

`cargo build --release --target=armv7-unknown-linux-gnueabihf`

### Additional targets

View a list of available targets with `rustup target list`, and add a new one to the current compiler version's toolchain with `rustup target add <target>`.

Finally, tell Cargo what linker to use by adding a new config section (to `/root/.cargo/config` by default):

```
[target.armv7-unknown-linux-gnueabihf]
linker = "/usr/bin/arm-linux-gnueabihf-gcc"
```

### Share host Cargo cache

Ensure your Cargo config has the correct linker paths set up as above, then start a rust-cross container with:

```
  docker run --rm -it \
  --env CARGO_HOME=/cargo \
  --volume ~/.cargo:/cargo \
  --volume $(pwd):/src \
  advancedtelematic/rust-cross
```
