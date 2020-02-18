TAHO_HOME=/appserv/pentaho440/data-integration
TAHO_JOBS=/skedul/etl_open/siac-int-01/siacetlbo

$TAHO_HOME/kitchen.sh -file=$TAHO_JOBS/pcc/invio-marc.kjb	\
	-param:codice_ente=$1									\
	-param:skip_update_registrazione_data=${2:-true}		\
	-level=${PLOGLEVEL:-Basic}