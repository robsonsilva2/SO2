#Etapa 1: Instalar e Configurar o Servidor Web (Apache)

#Atualiza os pacotes e instala o Apache2:
sudo apt-get update
sudo apt-get install apache2

#Criando uma página de teste simples:
echo "<h1>Bem-vindo ao Servidor Web da Empresa!</h1>" | sudo tee /var/www/html/index.html

#Teste de acesso via navegador:
http: 10.0.2.15


#Etapa 2: Instalar e Configurar o Servidor DNS (BIND9)

#Instalando o BIND9:
sudo apt-get install bind9

#Configurando uma nova zona no BIND: 
sudo nano /etc/bind/named.conf.local

zone "empresa.loca"{
type master;
file "/etc/bind/db.empresa.local";
};

#Criando o arquivo da zona de pesquisa direta:
sudo nano /etc/bind/db.empresa.local

$TTL604800
@IN SOA ns1.empresa.local. root.empresa.local. (
2 ; Serial
604800 ; Refresh
86400 ; Retry
2419200 ; Expire
604800 ) ; Negative Cache TTL
:
@IN NS ns1.empresa.local.
ns1 IN A 10.0.2.15
www IN A 10.0.2.15

#Etapa 3: Reiniciar, Configurar Cliente e Testar

#Reiniciando o serviço BIND:
sudo  systemctl restart bind9

#Configurando o DNS da VM em:
nano /etc/resolv.conf:

#Adicionado no topo:
nameserver 127.0.0.53

#Testando a solução de nome:
dig www.empresa.local

#Teste final com curl:
curl http://www.empresa.local




