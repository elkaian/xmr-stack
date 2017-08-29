#!/bin/sh
set -e

sysctl -w vm.nr_hugepages=128

sed -i -e "s/\${POOL}/$POOL/g" /xmr-stak-cpu/bin/config.txt
sed -i -e "s/\${ADDRESS}/$ADDRESS/g" /xmr-stak-cpu/bin/config.txt
sed -i -e "s/\${PORT}/$PORT/g" /xmr-stak-cpu/bin/config.txt

exec "$@"
