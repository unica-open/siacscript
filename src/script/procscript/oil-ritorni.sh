ETL_SRC=/skedul/etl_open/siac-int-01/siacetlbo/ordinativoInformatico/

/appserv/pentaho440/data-integration/kitchen.sh -file=$ETL_SRC/ritorni/run-mif-xxxx.kjb \
        -level=Detailed                                                        \
        -param:codice_ente=$1                                                  \
        -param:anno_bilancio=$2													\
		-param:codice_tipo_flusso=$3