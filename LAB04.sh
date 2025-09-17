#Etapa 1: Instalar e Configurar o Servidor Web (Apache)

sudo apt-get update
sudo apt-get install apache2

echo "<h1>Bem-vindo ao Servidor Web da Empresa!</h1>" | sudo tee /var/www/html/index.html

http: 10.0.2.15


#Etapa 2: Instalar e Configurar o Servidor DNS (BIND9)

sudo apt-get install bind9

sudo nano /etc/bind/named.conf.local

zone "empresa.loca"{
type master;
file "/etc/bind/db.empresa.local";
};


