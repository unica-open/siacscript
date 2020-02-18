export ETL_PROD=/skedul/etl_open/siac-int-01/siacetlbo
data_elaborazione=`date +%Y-%m-%d`
echo $data_elaborazione

cd $ETL_PROD
/appserv/pentaho440/data-integration/kitchen.sh -file=$ETL_PROD/bilarm/etl/run_bilancio_armonizzato.kjb \
-param:codice_ente=$1 \
-param:anno_bilancio=$2 \
-level=Basic
