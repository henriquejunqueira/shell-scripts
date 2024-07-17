#!/bin/bash
# Script de Verificação de Segurança para Linux

clear

echo "Digite a opção:"
echo "1. Verificar Atualizações do Sistema"
echo "2. Verificar Arquivos Suid/GuiD"
echo "3. Verificar Arquivos no Diretório /tmp"
echo "4. Verificar Conexões de Rede"
echo "5. Verificar Usuários Logados"
echo "6. Verificar Logs de Autenticação"
echo "7. Verificar Programas de Inicialização"
echo "8. Verificar Cron Jobs"
echo "9. Verificar Últimos Logins"
echo "10. Sair"
read opcao

if [ "$opcao" -eq "1" ]; then
	echo "Verificando Atualizações do Sistema"
	sudo apt update && sudo apt list --upgradable
elif [ "$opcao" -eq "2" ]; then
	echo "Verificando Arquivos Suid/GuiD"
	find / -type f \( -perm -4000 -o -perm -2000 \) -exec ls -la {} \;
elif [ "$opcao" -eq "3" ]; then
	echo "Verificando Arquivos no Diretório /tmp"
	ls -la /tmp
elif [ "$opcao" -eq "4" ]; then
	echo "Verificando Conexões de Rede"
	netstat -tuln
elif [ "$opcao" -eq "5" ]; then
	echo "Verificando Usuários Logados"
	who
elif [ "$opcao" -eq "6" ]; then
	echo "Verificando Logs de Autenticação"
	cat /var/log/auth.log
elif [ "$opcao" -eq "7" ]; then
	echo "Verificando Programas de Inicialização"
	ls -la /etc/init.d/
elif [ "$opcao" -eq "8" ]; then
	echo "Verificando Cron Jobs"
	crontab -l
elif [ "$opcao" -eq "9" ]; then
	echo "Verificando Últimos Logins"
	last
else
	echo "Saindo"
	exit
fi

