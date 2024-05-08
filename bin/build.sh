#!/usr/bin/env bash

if [[ "$1" == "" ]] ; then
	echo "Proporcione una rama para entregar (develop o Fase_3)"
	exit
fi

DIR_PROJECT=/home/federico/git/AppSapiens
RAMA=$1

ENTREGABLES=Entregables
MDVAL_PROJECT=MDVAL
MDSQL_PROJECT=MDSQL
MDCOMMON=mdcommon
BUILD_DIR=target

MDVAL_PACKAGE=
MDSQL_PACKAGE=mdsql-1.0.0-SNAPSHOT.jar
MDSQL_SOURCE=mdsql-1.0.0-SNAPSHOT-sources.jar

LATEST=`$DIR_PROJECT/bin/version.sh`
SUMMARY=`$DIR_PROJECT/bin/resueltas.sh $LATEST`
TO=Mario.Pampliega@sapiens.com
CC=agarcia@esoluzion.com,fmartin@esoluzion.com,Maria.De-Vera@sapiens.com,jmjimenez@esoluzion.com

clear

if [[ "$LATEST" == "" ]] ; then
	echo "No hay versión liberada aún"
	exit
fi


echo "Se va a construir la entrega ${DIR_PROJECT}/$MDSQL para la rama $RAMA"

echo "Construyendo arquitectura común..."

cd $DIR_PROJECT/$MDCOMMON

mvn clean install
if [ $? -ne 0 ] ; then
	echo "Ocurrió un error al construir la arquitectura común"
	exit
fi

clear

echo "Construyendo $MDSQL_PROJECT"

cd $DIR_PROJECT/$MDSQL_PROJECT

mvn clean install -DskipTests=true
if [ $? -ne 0 ] ; then
	echo "Ocurrió un error al construir el proyecto $MDSQL_PROJECT"
	exit
fi

clear

echo "Instalando $MDSQL_PROJECT"

#rm *.zip

[ ! -d "$DIR_PROJECT/$ENTREGABLES" ] && mkdir $DIR_PROJECT/$ENTREGABLES

cd $DIR_PROJECT/$MDSQL_PROJECT/$BUILD_DIR

cp $MDSQL_PACKAGE $DIR_PROJECT/$ENTREGABLES/$MDSQL_PROJECT
#cp $MDSQL_SOURCE $DIR_PROJECT/$ENTREGABLES/$MDSQL_PROJECT

cd $DIR_PROJECT/$MDSQL_PROJECT

cp CHANGELOG.md $DIR_PROJECT/$ENTREGABLES/$MDSQL_PROJECT
if [ $? -ne 0 ] ; then
	echo "Ocurrió un error al copiar el fichero CHANGELOG.md"
	exit
fi

cp literales.properties $DIR_PROJECT/$ENTREGABLES/$MDSQL_PROJECT
if [ $? -ne 0 ] ; then
	echo "Ocurrió un error al copiar el fichero literales.properties"
	exit
fi

cp configuration.properties $DIR_PROJECT/$ENTREGABLES/$MDSQL_PROJECT
if [ $? -ne 0 ] ; then
	echo "Ocurrió un error al copiar el fichero configuration.properties"
	exit
fi

cp mdsql.bat $DIR_PROJECT/$ENTREGABLES/$MDSQL_PROJECT
if [ $? -ne 0 ] ; then
	echo "Ocurrió un error al copiar el fichero mdsql.bat"
	exit
fi

cp mdsql.sh $DIR_PROJECT/$ENTREGABLES/$MDSQL_PROJECT
if [ $? -ne 0 ] ; then
	echo "Ocurrió un error al copiar el fichero mdsql.sh"
	exit
fi

cp logotipo.png $DIR_PROJECT/$ENTREGABLES/$MDSQL_PROJECT
if [ $? -ne 0 ] ; then
	echo "Ocurrió un error al copiar el fichero logotipo.png"
	exit
fi

git add .
if [ $? -ne 0 ] ; then
	echo "Ocurrió un error al añadir archivos para commit"
	exit
fi

echo "Archivos de instalación copiados"

clear

echo "Comprimiendo paquete..."

cd $DIR_PROJECT/$ENTREGABLES/

zip -9 -r $MDSQL_PROJECT.zip $MDSQL_PROJECT/
if [ $? -ne 0 ] ; then
	echo "No se ha podido crear el paquete $MDSQL_PROJECT.zip"
	exit
fi

mv $MDSQL_PROJECT.zip $MDSQL_PROJECT-$LATEST.zip
#rm -r $DIR_PROJECT/$ENTREGABLES

git add $MDSQL_PROJECT-$LATEST.zip
if [ $? -ne 0 ] ; then
	echo "Ocurrió un error al añadir archivo $MDSQL_PROJECT-$LATEST.zip para commit"
	exit
fi

git commit -m "Entregable $LATEST"
if [ $? -ne 0 ] ; then
	echo "Ocurrió un error al hacer commit"
	exit
fi

git push
if [ $? -ne 0 ] ; then
	echo "Ocurrió un error al hacer push"
	exit
fi

#echo "Enviando aviso a $TO con copia a $CC"

#echo "Muy señor mío/a.

#Nos complace comunicarle que está disponible para su revisión la entrega

#https://github.com/lHernan/AppSapiens/blob/$RAMA/Entregables/$MDSQL_PROJECT-$LATEST.zip

#El video de entrega se encuentra en:

#https://github.com/lHernan/AppSapiens/blob/$RAMA/Entregables/$MDSQL_PROJECT-$LATEST.wmv

#Las siguientes incidencias se han solucionado, rogamos las revisen:

#$SUMMARY

#Cualquier error nos lo comunican lo más pronto posible para poder solucionarlo.

#Atentamente
#Federico Martín Lara <fmartin@esoluzion.com>" | mail -s "Entregable $LATEST" -aCC:$CC $TO
#if [ $? -ne 0 ] ; then
#	echo "Ocurrió un error al enviar aviso"
#	exit
#fi

#$DIR_PROJECT/bin/entregar.sh $MDSQL_PROJECT $LATEST
echo "Entrega $LATEST completada"
