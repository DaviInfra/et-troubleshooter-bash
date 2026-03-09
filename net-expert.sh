#!/bin/bash

# Identificação do Sistema
echo "=================================================="
echo "   SISTEMA: $(hostname)"
echo "   DATA: $(date)"
echo "=================================================="

# 1. Teste de Conectividade (Seu código original)
echo -e "\n--- Verificando Conectividade Externa (Google) ---"
ping -c 4 8.8.8.8

# 2. Teste de Gateway (Novo)
echo -e "\n--- Verificando Rota de Saída (Gateway) ---"
GW=$(ip route | grep default | awk '{print $3}')
echo "Seu Gateway padrão é: $GW"
ping -c 2 $GW

# 3. Teste de DNS (Seu código original)
echo -e "\n--- Testando Resolução de Nomes (DNS) ---"
nslookup google.com

# 4. Configurações de IP (Seu código original)
echo -e "\n--- Suas Interfaces de Rede ---"
ip addr show | grep "inet "

# 5. Consumo de Memória (Novo)
echo -e "\n--- Status de Memória do Sistema ---"
free -h

echo -e "\n=================================================="
echo "          DIAGNÓSTICO CONCLUÍDO                 "
echo "=================================================="
