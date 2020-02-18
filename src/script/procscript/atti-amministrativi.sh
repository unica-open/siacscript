# runs from /skedul/procsked/procscript/
ETL_SRC=/skedul/etl_open/siac-int-01/siacetlbo

#
# Il codice producer in pratica è il nome del folder figlio della cartella 
# /interscambio_ent/skedul/
# che di fatto rappresenta "codice Istanza di Prodotto" del fornitore dei dati.
#
# cod_producer : codice della istanza (cartella) del produttore del file
# codice_ente  : codice dell'ente per cui son stati prodotti i file ?
#
/appserv/pentaho440/data-integration/kitchen.sh 									\
	-file=$ETL_SRC/attiAmministrativi/etl/run-atti_amministrativi.kjb				\
	-level=${PLOGLEVEL:-Basic}														\
	-param:cod_producer=$1															\
	-param:codice_ente=$2
	
