#!/bin/bash
OUT_DIR=${4:-out/ordinativi-informatici-upload}
mkdir -p $OUT_DIR
echo "reading $1"
FNAME_TPL=$3
TEMPLATE=$2
# while and sed are broken down for readability
while IFS=$';' read -r cod_ente anno start_time 
do
 sed -e "s|{start_time}|$start_time|g"\
 -e "s|{anno}|$anno|g"\
 -e "s|{cod_ente}|$cod_ente|g"\
 $TEMPLATE > $OUT_DIR/${FNAME_TPL}_$cod_ente.job.xml
echo "creato job pr l'ente $cod_ente"
done < $1
exit
