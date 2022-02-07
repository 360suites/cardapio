#!/bin/bash

echo "###############################################"
echo "# Descrição: script Limpeza S3 backup jenkins #"
echo "# Autor: Luciano d Avilla Ferreira            #"
echo "# Data: 01/02/2022			                #"
echo "# Email: luciano.ferreira@monitoratec.com.br  #"
echo "###############################################"


WEEK=`date +%Y-%m-%d -d "7 days ago"`

DEAD=`aws s3 ls s3://monitora-jenkins-backup/ --profile luciano.ferreira |grep $WEEK |awk '{print$4}'`

aws s3 rm s3://monitora-jenkins-backup/$DEAD --profile luciano.ferreira |grep $DEAD
