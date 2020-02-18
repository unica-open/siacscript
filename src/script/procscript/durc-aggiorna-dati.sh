CODICE_LINEA_CLIENTE=$1
CODICE_ENTE=$2

[ -z $CODICE_ENTE ] && echo "ERRORE: valorizzare il codice ente" && exit 1

IN_DIR=/interscambio_ent/skedul/siac-int-01/in/eope
ARCH_DIR=/skedul/archivio/siac-int-01/durc

mkdir -p $ARCH_DIR

ls -1 $IN_DIR/*$CODICE_ENTE*.json | while read f
do 
	echo "Inizio elaborazione file $f"
	/skedul/java/siac-mul-01/siacbatch/bin/run-durc $CODICE_LINEA_CLIENTE SIAC-$CODICE_ENTE $f
    [ $? = "1" ] && echo "ERRORE: elaborazione file $f" && continue
	FOK=$ARCH_DIR/$(date +"%Y-%m-%d_%H.%M.%S")_$(basename $f)
	mv $f $FOK 
	gzip -9 $FOK
	echo "Fine elaborazione file $f OK"
done

