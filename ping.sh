#!/bin/bash
#pinggagol.sh
#
#    Efetua ping enviando 2 pacotes para $DESTINO.
#Se receber os 2 pacotes é considerado como UP (1), Caso contrario como DOWN (0)
#Este script foi criado para ser utilizado com o zabbix 
#Comando adicionado no zabbix_agent.conf -> UserParameter=pingando[*],sh /etc/zabbix/ping.sh $1
#
#Ivan de Almeida Cornedi		
#

DESTINO=$1;

PING=$(ping -c2 -w2 ${DESTINO} | grep icmp_seq | wc -l)

case ${PING} in

    2) echo "1";
    ;;
    *) echo "0";
    ;;

esac
