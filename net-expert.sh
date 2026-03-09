#!/bin/bash

#!/bin/bash

echo "=========================================="
echo "   REDE E SISTEMA - TROUBLESHOOTER V1     "
echo "=========================================="

# 1. Teste de conectividade externa
echo -e "\n[1] Verificando Internet (Google Ping)..."
if ping -c 3 8.8.8.8 > /dev/null; then
    echo ">> OK: Internet funcionando."
else
    echo ">> ERRO: Sem resposta do 8.8.8.8."
fi

# 2. Teste de Gateway (Roteador)
echo -e "\n[2] Verificando Gateway Padrão..."
GATEWAY=$(ip route | grep default | awk '{print $3}')
if [ -z "$GATEWAY" ]; then
    echo ">> ERRO: Gateway não encontrado!"
else
    echo ">> Gateway detectado: $GATEWAY"
    if ping -c 2 $GATEWAY > /dev/null; then
        echo ">> OK: Comunicação com o roteador está estável."
    else
        echo ">> ERRO: O roteador não responde ao ping."
    fi
fi

# 3. Teste de DNS
echo -e "\n[3] Testando Resolução de DNS..."
if nslookup google.com > /dev/null 2>&1; then
    echo ">> OK: DNS resolvendo nomes corretamente."
else
    echo ">> ERRO: Falha ao resolver domínios."
fi

# 4. Consumo de Memória
echo -e "\n[4] Status da Memória RAM..."
free -h | grep -E "total|Mem"

echo -e "\n=========================================="
