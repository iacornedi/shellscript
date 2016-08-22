#!/bin/bash
#mixar_gravacoes.sh
#
#	Script utilizado para mixar grava��es da ponta A e ponta B.
#  Desenvolvi este scrip como solu��o paleativa para um problema que ocorria por causa do Elastix+Asternic.
#  A pessoa que implantou o asterisk n�o sabia por que ocorria este problema e n�o tive oportunidade  
#de investigar a fundo sua causa. Como o cliente precisava das grava��es, criei este script e deixei
#agendado no cron para executar ao fim do expediente.
#

#Lista as grava��es que n�o foram mixadas e atriboe a ${NOMEIN} e ${NOMEOUT}
NOMEIN=($(ls /var/spool/asterisk/monitor/q*-in.WAV))
NOMEOUT=($(ls /var/spool/asterisk/monitor/q*-out.WAV))

#--- Mixar
for ((i=0;$i<=${#NOMEIN[@]};i++))
 do
	#--- Usado para teste - Caso queira o que ocorrer�  
	#--- echo " in -> ${NOMEIN[$i]}  out -> ${NOMEOUT[$i]} nome ->  $(ls ${NOMEIN[$i]} | cut -c 1-100 | cut -d. -f 1,2 | cut -d- -f1-4).WAV"
	#--- 
	sox -m ${NOMEIN[$i]} ${NOMEOUT[$i]} $(ls ${NOMEIN[$i]} | cut -c 1-100 | cut -d. -f 1,2 | cut -d- -f1-4).WAV
 done

#Apagar arquivos n�o mixados
rm -rfv /var/spool/asterisk/monitor/q*in.WAV
rm -rfv /var/spool/asterisk/monitor/q*out.WAV


