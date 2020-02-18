#!/bin/bash
mkdir out
echo "reading $1"
# while and sed are broken down for readability
while IFS=$';' read -r cod_ente anno
do
 sed -e "s|{anno}|$anno|g"\
 -e "s|{cod_ente}|$cod_ente|g"\
 $2 > out/bilarm_$cod_ente.job.xml
echo "creato file configurazione $cod_ente"
done < $1
exit
