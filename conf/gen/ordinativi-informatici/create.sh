#!/bin/bash
mkdir out
echo "reading $1"
FNAME_TPL=$3
# while and sed are broken down for readability
while IFS=$';' read -r cod_ente anno start_time 
do
 sed -e "s|{start_time}|$start_time|g"\
 -e "s|{anno}|$anno|g"\
 -e "s|{cod_ente}|$cod_ente|g"\
 $2 > out/${FNAME_TPL}_${cod_ente}.job.xml
echo "creato file configurazione $cod_ente"
done < $1
exit
