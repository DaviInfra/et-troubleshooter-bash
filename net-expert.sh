#!/bin/bash

# Cores para o relatório ficar profissional
VERDE='\033[0;32m'
AMARELO='\033[1;33m'
VERMELHO='\033[0;31m'
NC='\033[0m' # Sem cor

clear
echo -e "${AMARELO}==========================================${NC}"
echo -e "${AMARELO}    DIAGNÓSTICO DE REDE AVANÇADO         ${NC}"
echo -e "${AMARELO}==========================================${NC}"

# 1. TESTE DE INTERNET
echo -e "\n[+] Testando saída para a Internet (Google)..."
if ping -c 2 8.8.8.8 &> /dev/null; then
    echo -e "${VERDE}Conectividade OK!${NC}"
else
    echo -e "${VERMELHO}ERRO: Sem acesso à Internet.${NC}"
fi

# 2. TESTE DE DNS
echo -e "\n[+] Testando Resolução de Nomes (DNS)..."
if nslookup google.com &> /dev/null; then
    echo -e "${VERDE}DNS OK!${NC}"
else
    echo -e "${VERMELHO}ERRO: Falha ao converter nome em IP.${NC}"
fi

# 3. IDENTIFICAÇÃO DE IPs
echo -e "\n[+] Endereços IP da Máquina:"
echo "Interno: $(hostname -I | awk '{print $1}')"
echo "Externo: $(curl -s ifconfig.me || echo 'Não foi possível obter IP externo')"

# 4. PORTAS EM ESCUTA (SERVIÇOS ATIVOS)
echo -e "\n[+] Serviços rodando (Portas abertas):"
ss -tulpn | grep LISTEN | awk '{print "Serviço: " $7 " na Porta: " $4}' | sed 's/users:(("//g' | sed 's/",.*//g'

echo -e "\n${AMARELO}==========================================${NC}"
