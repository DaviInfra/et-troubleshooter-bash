# 🌐 Net-Troubleshooter-Bash

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Bash](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)

Este é um script de automação desenvolvido para **Analistas de Redes e Infraestrutura**. Ele centraliza os principais diagnósticos de conectividade em um único comando, economizando tempo em momentos de troubleshoot.

## 🚀 Funcionalidades
- **Teste de Internet:** Verifica a conectividade externa via ping aos servidores da Google (8.8.8.8).
- **Teste de Gateway:** Identifica automaticamente o IP do teu router e testa a comunicação local.
- **Resolução de DNS:** Valida se o sistema consegue converter nomes de domínio em IPs.
- **Identificação de IPs:** Mostra o teu IP interno da rede e o teu IP público na internet.
- **Varredura de Portas:** Lista todos os serviços que estão à escuta (LISTEN) no sistema.
- **Interface Visual:** Relatórios coloridos para facilitar a leitura de erros e sucessos.

## 💻 Como Executar
Para rodar o diagnóstico no seu servidor Linux:

1. Clone o repositório:
```bash
git clone [https://github.com/DaviInfra/net-troubleshooter-bash.git](https://github.com/DaviInfra/net-troubleshooter-bash.git)
