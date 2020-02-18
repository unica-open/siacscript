ETL_SRC=/skedul/etl_open/siac-int-01/siacetlbo/scarichi_massivi/etl

#
# codice_ente	: 	codice dell'ente (=> ente_proprietario_id) del quale effettuare il dump
# anno_bilancio :	anno di riferimento 
#
/appserv/pentaho440/data-integration/kitchen.sh -file=$ETL_SRC/run_$1.kjb \
		-level=${PLOGLEVEL:-Basic}										  \
        -param:codice_ente=$2                                             \
        -param:anno_bilancio=$3                                                                 