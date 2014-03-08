#!/bin/bash
PUB=""
PAG=0
NAM="ISSUU_page_"
DIRIMG="ISSUU_img"
DIRPUB="ISSUU_pub"


# vedo se c'è e altrimenti creo directory immagini
if [[ -d $DIRIMG ]]; then
	rm -rf $DIRIMG/*
else
	mkdir $DIRIMG
fi


#  vedo se c'è e altrimenti creo directory pubblicazioni
if [[ -d $DIRPUB ]]; then
	echo ""
else
	mkdir $DIRPUB
fi


# vedo se il primo parametro (poi, se non lo è il primo, il terzo) è -p e se così associo PAG a questo
if [[ "-pag" == "$1" ]]; then
	PAG=$2;
elif [[ "-pag" == "$3" ]]; then
	PAG=$4
else
	ERROR=true
fi


# vedo se il primo parametro (poi, se non lo è il primo, il terzo) è -p e se così associo PAG a questo
if [[ "-pub" == "$1" ]]; then
	PUB=$2;
elif [[ "-pub" == "$3" ]]; then
	PUB=$4
else
	ERROR=true
fi


cd $DIRIMG

for X in $( seq 1 $PAG ); do
	PAGX="page_$X.jpg"
	URL="http://image.issuu.com/$PUB/jpg/$PAGX"
	wget $URL -O $NAM$X
done

cd ..


# LAVORO DA FARE
# Aggiungere la verifica della presenza di Imagemagick
convert ISSUU_img/ISSUU_page_* ISSUU_pub/ISSUU_pub.pdf


echo "WORK'S WELL END!"
echo "Go in ~/ISSUU_pub/ and rename ISSUU_pub.pdf the name you want."
echo "BYE."



# fonte: http://blog.lucaciavatta.com/guida-definitiva-scaricare-libri-fare-download-riviste-issuu/