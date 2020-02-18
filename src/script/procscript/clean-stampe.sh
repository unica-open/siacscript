TAHO_HOME=/appserv/pentaho440/data-integration
TAHO_JOBS=/skedul/etl_open/siac-int-01/siacetlbo

$TAHO_HOME/kitchen.sh -file=$TAHO_JOBS/cleanups/stampe-cleanup.kjb	\
	-param:codice_ente=$1											\
	-level=${PLOGLEVEL:-Basic}
