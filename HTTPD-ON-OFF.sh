#!/bin/bash

# IP do servidor NFS
IP_NFS="172.31.0.23"

# Função que verifica o status do serviço
verificar_servico() {
    if systemctl is-active httpd >/dev/null 2>&1; then
        STATUS="Online"
        MENSAGEM="O serviço httpd está online."
        ARQUIVO_RESULTADO="/nfs-share/Igor/Status-HTTPD/httpd-online.txt"
    else
        STATUS="Offline"
        MENSAGEM="O serviço httpd está offline."
        ARQUIVO_RESULTADO="/nfs-share/Igor/Status-HTTPD/httpd-offline.txt"
    fi
}

DATA_HORA=$(date +"%Y-%m-%d %H:%M:%S")

verificar_servico

# Conteúdo a ser escrito no txt
CONTEUDO="$DATA_HORA - Serviço: httpd - Status: $STATUS - $MENSAGEM"

# Escreve o conteúdo no arquivo, adicionando uma nova linha
echo "$CONTEUDO" >> "$ARQUIVO_RESULTADO"

echo "O resultado da verificação do serviço HTTPD pode ser conferido em: $ARQUIVO_RESULTADO"