#Etapa 1: Configurar o Firewall com IPTABLES

nano firewall.sh
# !/bin/bash
echo "Aplicando regras de firerall..."

# Limpa todas as regras antigas
iptables -F
iptables -X

# Define a politica padrão: bloquear tudo que entra
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Permite conexões já estabelecidas
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Permite acesso local
iptables -A INPUT -i lo -j ACCEPT

# SSH (porta 2244)
iptables -A INPUT -p tcp --dport 2244 -j ACCEPT

# Servidor Web (porta 80)
iptables -A INPUT -p tcp --dport 80  - j ACCEPT

# Servidor DNS (porta 53)
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT

echo "Firewall configurado!"
iptables -L -n -v

chmod +x firewall.sh
sudo ./firewall.sh

#Etapa 2: Instalar e Configurar o PROXY (Squid)

sudo apt-get install squid

sudo nano /etc/squid/sites_bloqueados.txt

.facebook.com
.twitter.com
.instagram.com

sudo nano /etc/squid/squid.conf

acl sites_bloqueados dstdomain "/etc/squid/sites_bloqueados.txt"
http_access deny sites_bloqueados

#Etapa 3: Reiniciar e Testar

sudo systemctl restart squid




