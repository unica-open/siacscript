#
# Pulisce i file temporanei prodotti dal job di scarico massivo
#
ETL_SRC=/skedul/etl_open/siac-int-01/siacetlbo/

/appserv/pentaho440/data-integration/kitchen.sh -file=$ETL_SRC/scarichi_massivi/etl/clean_oldfiles.kjb	\
		-level=${PLOGLEVEL:-Basic}