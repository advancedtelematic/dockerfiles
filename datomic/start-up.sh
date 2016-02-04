#!/bin/sh

DATOMIC_CFG="/opt/datomic/free-transactor.properties"

echo alt-host="${DATOMIC_HOST}" >> $DATOMIC_CFG

exec /opt/datomic/bin/transactor $DATOMIC_CFG $*
