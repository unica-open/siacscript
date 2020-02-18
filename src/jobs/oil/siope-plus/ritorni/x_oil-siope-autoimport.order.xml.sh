#!/bin/sh


while read eu
do 
	e=$(echo $eu | cut -f1 -d:)
        lc=$(echo $eu | cut -f2 -d:)
	u=$(echo $eu | cut -f3 -d:)

	sed -e "s/@@ENTE/${e}/" x_oil-siope-autoimport,OIL_IMPORT_EMIOFE.order.xml.template | \
		sed -e "s/@@LINEA_CLIENTE/${lc}/" | \
		sed -e "s/@@CODICE_MIF_UNIIT/${u}/" \
                > oil-siope-autoimport,OIL_${e}_IMPORT_EMIOFE.order.xml

        sed -e "s/@@ENTE/${e}/" x_oil-siope-autoimport,OIL_IMPORT_GDC.order.xml.template | \
                sed -e "s/@@CODICE_MIF_UNIIT/${u}/" | \
                sed -e "s/@@LINEA_CLIENTE/${lc}/"  \
                > oil-siope-autoimport,OIL_${e}_IMPORT_GDC.order.xml

done < ../x_enti.txt

