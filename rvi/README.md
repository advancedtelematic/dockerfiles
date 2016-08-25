# RVI node in Docker

Run a RVI node in Docker.

See [GENIVI/rvi_core](https://github.com/GENIVI/rvi_core) for documentation on RVI.

## Quickstart

### Backend Server node

To quickly spin up a development RVI node, with a [server
configuration](https://github.com/advancedtelematic/dockerfiles/blob/master/rvi/backend.rvi.config)
and disabled bluetooth run:

```sh
docker run -dt \
  -p 8801:8801 \
  --expose 8801 \
  --env "RVI_LOGLEVEL=debug"
  --name rvi-backend
  advancedtelematic/rvi backend
```

### Device Client node

To quickly spin up a development RVI node, with a [client
configuration](https://github.com/advancedtelematic/dockerfiles/blob/master/rvi/device.rvi.config)
and disabled bluetooth run:

```sh
docker run -dt
  -p 8901:8901
  --link rvi-backend
  --env "RVI_BACKEND=rvi-backend"
  --env "RVI_BACKEND_PORT=8807"
  --env "RVI_LOGLEVEL=debug"
  --env "DEVICE_ID=V1234567890123456"
  --name rvi-device
  advancedtelematic/rvi device
```
