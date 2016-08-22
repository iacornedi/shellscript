#!/bin/bash
#Pingados.sh
#
#	Script utilizado para 'pingar' multiplus IPs.
#	- Os IPs devem estar listados em um arquivo externo
#

#--- Chaves
QTD=2		#--- Quantidade de 'pings'
TMP=2		#--- Quantidade de segundos

#--- Caminho do arquivo
TXT=/root/ips

#--- Cria array com base no arquivo informado
IP=($(cat ${TXT}))

for ((i=0;$i<=${#IP[@]};i++))
    do
	case ${IP[$i]} in
	    "") echo "Em branco";
	    ;;

	    *) echo "Enviando ${QTD} ping(s) para o ${IP[$i]} com o tempo de ${TMP} segundo(s)";
	    
	        PING=$(ping -c${QTD} -w${TMP} ${IP[$i]} | grep icmp_seq | wc -l)
	
    	        case ${PING} in
	           ${QTD}) echo "1";
	           ;;
	           *) echo "0";
	           ;;
		esac
	    ;;
	esac	
    done
