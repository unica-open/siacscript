#!/bin/sh


while read eu
do 
	e=$(echo $eu | cut -f1 -d:)

        sed -e "s/@@ENTE/${e}/" x_oil-es-export-totale-api,OIL-ES_SPLUS.order.xml.template  \
                > oil-es-export-totale-api,OIL-ES-${e}_SPLUS.order.xml

done < x_enti.txt

