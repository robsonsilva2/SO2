#Etapa 1: Instalação do Samba

sudo apt-get update
sudo apt-get install samba

#Etapa 2: Adicionar Usuários ao SAMBA

sudo smbpasswd -a dev_senior

sudo smbpasswd -a dev_junior

#Etapa 3: Criar Diretórios para Compartilhamento

sudo mkdir -p /srv/samba/publico
sudo chown nobody:nogroup /srv/samba/publico
sudo chmod 777 /srv/samba/publico

#Etapa 4: Configurar os Compartilhamento

 sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bkp
 sudo nano /etc/samba/smb.conf

 [publico]
 comment = Compartilhamento Publico de Arquivos
 path = /srv/samba/publico
 browsable = yes
 writable = yes
 guest ok = yes
 read only = no

 [projetos]
 comment = Acesso Restrito para a Equipe de Desenvolvimento
 path = /srv/projetos
 valid users = @desenvolvedores
 read only = no
 browsable = yes
 writable = yes

 #Etapa 5: Reiniciar e Testar
 
 sudo systemctl restart smbd
 #output
 enabled; preset: enabled
 Active: active (running) since Mon 2025-09-15 14:36:40 -03; 4min 12s ago
 
 sudo systemctl restart nmbd
 #output
 enabled; preset: enabled
 Active: active (running) since Mon 2025-09-15 14:37:11 -03; 11min ago

 
testparm
Load smb config files from /etc/samba/smb.conf
Loaded services file ok.
[publico]
comment = Compartilhamento publico de arquivos
guest ok = yes
path = /srv/samba/publico
read only = No

[projetos]
comment = Acesso restristo para a equipe de desenvolvimento
path = /srv/projetos
read only =  No
valid users = @desenvolvedores



