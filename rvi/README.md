# RVI node in Docker

Run a RVI node in Docker.

See [PDXostc/rvi_core](https://github.com/PDXostc/rvi_core) for documentation on
RVI.

## Quickstart

### Server node

To quickly spin up a development RVI node, with a [server
configuration](https://github.com/advancedtelematic/dockerfiles/blob/master/rvi/rvi_server.config)
and disabled bluetooth run:

```sh
docker run -it \
  --expose 8801 \
  --expose 8805-8808 \
  -p 8801:8801 \
  -p 8805:8805 \
  -p 8806:8806 \
  -p 8807:8807 \
  -p 8808:8808 \
  advancedtelematic/rvi server
```

### Client node

To quickly spin up a development RVI node, with a [client
configuration](https://github.com/advancedtelematic/dockerfiles/blob/master/rvi/rvi_client.config)
and disabled bluetooth run:

```sh
docker run -it \
  --expose 8901 \
  --expose 8905-8908 \
  -p 8901:8901 \
  -p 8905:8905 \
  -p 8906:8906 \
  -p 8907:8907 \
  -p 8908:8908 \
  advancedtelematic/rvi client
```

## Configuration

You can load a different configuration by setting the environment variable
`CONFIGURATION` and mounting in your configuration file. Assuming you want to
use the file `/full/path/to/your.conf` run RVI like this, keep in mind, that you
might need to adjust the ports to match your setup:

```sh
docker run -it \
  --expose 8801-8808 \
  -p 8801:8801 \
  -p 8805:8805 \
  -p 8806:8806 \
  -p 8807:8807 \
  -p 8808:8808 \
  -v /full/path/to/your.conf:/new_rvi.config \
  -e CONFIGURATION=/new_rvi.config \
  advancedtelematic/rvi
```
