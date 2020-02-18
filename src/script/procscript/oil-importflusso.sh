# download flusso siope-plus

set -e
#set -x
ENTE=$1
LINEA_CLIENTE=$2
DATA_ELABORAZIONE=$3
TIPO_FLUSSO=$4
CODICE_FLUSSO=$5
DT=$(date +%Y%m%d_%H%M%S)
PFX="A_"
ZERO_VAL=0



# la cartella dove sono unzippati i file scaricati
OUTDIR=/skedul/progetti/siac-int-01/dati/wrk/oil-uniapi/$ENTE


if [ -z "$TIPO_FLUSSO" ]; then
	echo "Il TIPO di flusso (gdc o emiofe) non e' stato specificato"
	exit -1
fi

# chiama lo script run-oil_uniit per il download del file
# es: run-oil_uniit_ricevute   INT-01  RPI_OPI "gdc ricsisc" 2017-12-28   /tmp/
#
TMPFOLDER=$(mktemp -du -t uniit.XXXXXXXXX)
/skedul/java/siac-mul-01/siacbatch/bin/run-oil_uniit_ricevute $LINEA_CLIENTE RPI_OPI $TIPO_FLUSSO $DATA_ELABORAZIONE $TMPFOLDER/
ZIPFILE=$(ls $TMPFOLDER/*)

# verifica la presenza del file zip
NUM_ZIP_FILES=$(ls -1 $TMPFOLDER|wc -l)

if ["$NUM_ZIP_FILES" -ne "$ZERO_VAL"] then 
  # si assicura di eliminare ogni file precedente
  rm -rf $OUTDIR/$DATA_ELABORAZIONE
  mkdir -p $OUTDIR
  
  # scompatta lo zip scaricato ed elimina la cartella temporanea
  unzip -o $ZIPFILE $DATA_ELABORAZIONE/* -d $OUTDIR
  rm -rf $TMPFOLDER

  # conta i files unzippati
  NUM_FILES=$(ls -1 $OUTDIR/$DATA_ELABORAZIONE|wc -l)

  if ["$NUM_FILES" -ne "$ZERO_VAL"] then 
    # dopo unzippato rinomina i file (foRse)
    FILES=$(ls $OUTDIR/$DATA_ELABORAZIONE/*)
    for f in $FILES
    do
      dir=$(dirname $f)
      name=$(basename $f)
      echo "$f --> $dir/$PFX$name"
      # rinomina i file contenuti
      mv $f $dir/${PFX}${name}
    done
  
    # fine download flusso siope-plus
  
    # elaborazione flusso siope-plus
  
    # invoca il job pentaho per l'import delle firme
    ###################################################
  
    ANNO=$(echo "$DATA_ELABORAZIONE" | cut -d'-' -f1)
    ETL_SRC=/skedul/etl_open/siac-int-01/siacetlbo/ordinativoInformatico/
    /appserv/pentaho440/data-integration/kitchen.sh -file=$ETL_SRC/ritorni/run-mif-siopeplus-xxxx.kjb \
      -level=Basic  \
      -param:codice_ente=$ENTE                    \
      -param:anno_bilancio=$ANNO					\
      -param:data_elaborazione=$DATA_ELABORAZIONE \
	  -param:codice_tipo_flusso=$CODICE_FLUSSO
  
    # fine elaborazione flusso siope-plus
  
  else
    echo "Lo script run-oil_uniit_ricevute ha scaricato un file vuoto"
  fi
else
  echo "Lo script run-oil_uniit_ricevute non ha trovato o non ha scaricato files"
fi
