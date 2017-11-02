#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: makephysical.sh /path/to/physical_sysroot"
	exit 1
fi

TARGETDIR=$(realpath $1)
OSNAME="dummy-os"
BRANCHNAME="generated"
HARDWARE="dummy-hw"

echo "Creating OSTreee physical sysroot in ${TARGETDIR}"
rm -rf ${TARGETDIR}

mkdir -p ${TARGETDIR}
ostree admin --sysroot=${TARGETDIR} init-fs ${TARGETDIR}
ostree admin --sysroot=${TARGETDIR} os-init ${OSNAME}

mkdir -p ${TARGETDIR}/boot/loader.0
ln -s loader.0 ${TARGETDIR}/boot/loader

touch ${TARGETDIR}/boot/loader/uEnv.txt

OSTREE_DIR=$(mktemp -d /tmp/ostreephys-XXXXX)
makedeployed.sh ${OSTREE_DIR}/repo ${BRANCHNAME} ${HARDWARE}

CURDIR=${pwd}

cd ${OSTREE_DIR}/repo
python3 -m http.server 56042&
sleep 2

ostree --repo=${TARGETDIR}/ostree/repo remote add --no-gpg-verify generate-remote http://127.0.0.1:56042 ${BRANCHNAME}
ostree --repo=${TARGETDIR}/ostree/repo pull generate-remote  ${BRANCHNAME}
# kill SimpleHTTPServer
kill %1
export OSTREE_BOOT_PARTITION="/boot"

ostree admin --sysroot=${TARGETDIR} deploy --os=${OSNAME} ${BRANCHNAME}

exit 0
