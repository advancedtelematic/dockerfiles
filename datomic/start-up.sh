#!/bin/sh

echo alt-host="${DATOMIC_HOST}" >> ~/datomic/free-transactor.properties

exec /root/datomic/bin/transactor /root/datomic/free-transactor.properties $*
