#!/bin/sh
set -e

sysctl -w vm.nr_hugepages=128

for i in `seq 0 $(($CPU-1))` 
do
    CPUS=$CPUS"{ \"low_power_mode\" : false, \"no_prefetch\" : true, \"affine_to_cpu\" : $i },\n"
done

sed -i -e "s/\${CPU}/$CPUS/g" /xmr-stak-cpu/bin/config.txt
sed -i -e "s/\${POOL}/$POOL/g" /xmr-stak-cpu/bin/config.txt
sed -i -e "s/\${ADDRESS}/$ADDRESS/g" /xmr-stak-cpu/bin/config.txt
sed -i -e "s/\${PORT}/$PORT/g" /xmr-stak-cpu/bin/config.txt

exec "$@"
