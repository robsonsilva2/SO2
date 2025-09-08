# 1.Criação de  grupos
sudo groupadd desenvolvedores
sudo goupadd testadores

desenvolvedores:x:1001:
testadores:x:1002

# 2.Criaçaõ de usuários
sudo useradd -m -g desenvolvedores dev_senior
sudo useradd -m -g desenvolvedores dev_junior
sudo useradd -m -g testadores qa_analyst
sudo usermod -aG testadores dev_senior

dev_senior:x:1001:1001::/home/dev_senior:/bin/sh
dev_junior:x:1002:1001::/home/dev_junior:/bin/sh

# 3.Definição de Senhas
sudo passwd dev_senior

su - dev_junior


# 4.Estrutuar de Diretórios
sudo mkdir -p /srv/projetos/backend
sudo mkdir -p /srv/projetos/frontend

dir /srv/projetos

backend frontend

# 5.Gerenciamento de Permissões
sudo chown -R dev_senior:desnvolvedores /srv/projetos
sudo chmod -R 750 /srv/projetos

ls -l /srv/projetos
total 0
drwxr-x--- 1 dev_senior desenvolvedores 30 set 1 16:55 projetos

ls: não foi possivel abrir o diretório '/srv/projetos' :Permissão negada

# 6.Controle de processos
login dev_junior 
login: talvez não seja possivel trabalhar serm o root efetivamente
sudo login dev_junior
sleep 500 &
ps aux | grep sleep
jobs
sudo kill 1

$

# 7.Shell Script de Boas-Vindas


