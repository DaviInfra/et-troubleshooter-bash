#!/bin/bash

# Cores para o relatório
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

# 2. TESTE DE GATEWAY (O seu roteador)
echo -e "\n[+] Testando comunicação com o Gateway..."
GW=$(ip route | grep default | awk '{print $3}')
if [ -z "$GW" ]; then
    echo -e "${VERMELHO}ERRO: Gateway padrão não encontrado!${NC}"
else
    if ping -c 2 $GW &> /dev/null; then
        echo -e "${VERDE}Gateway ($GW) OK!${NC}"
    else
        echo -e "${VERMELHO}ERRO: Gateway ($GW) não responde (Local).${NC}"
    fi
fi

# 3. TESTE DE DNS
echo -e "\n[+] Testando Resolução de Nomes (DNS)..."
if nslookup google.com &> /dev/null; then
    echo -e "${VERDE}DNS OK!${NC}"
else
    echo -e "${VERMELHO}ERRO: Falha ao resolver nomes.${NC}"
fi

# 4. IDENTIFICAÇÃO DE IPs
echo -e "\n[+] Endereços IP da Máquina:"
echo "Interno: $(hostname -I | awk '{print $1}')"
echo "Externo: $(curl -s ifconfig.me || echo 'Timeout')"

# 5. PORTAS EM ESCUTA
echo -e "\n[+] Serviços rodando (Portas abertas):"
ss -tulpn | grep LISTEN | awk '{print "Serviço: " $7 " na Porta: " $4}' | sed 's/users:(("//g' | sed 's/",.*//g'

echo -e "\n${AMARELO}==========================================${NC}"
