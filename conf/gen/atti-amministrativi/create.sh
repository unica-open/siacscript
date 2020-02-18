#!/bin/bash
mkdir out
echo "reading $1"
FNAME_TPL=${3:-push_atti}
# while and sed are broken down for readability
while IFS=$';' read -r cod_ente istanza_fornitore start_time 
do
 sed -e "s|{start_time}|$start_time|g"\
 -e "s|{cod_ente}|$cod_ente|g"\
 -e "s|{istanza_fornitore}|$istanza_fornitore|g"\
 $2 > out/${FNAME_TPL}_${cod_ente}.job.xml
echo "creato file configurazione $cod_ente"
done < $1
exit
