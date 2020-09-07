#!/bin/bash
echo "Seu nome de usuário é:"
whoami

echo ""
echo "Instalador do Notepad-Browser 0.1"
echo ""
echo "Feito pela Daviny Vidal"
echo "www.daviny.vidal.nom.br"
echo ""
echo "https://github.com/davinyvidal/Notepad-Browser"
echo ""
echo ""
echo "Preparando os arquivos"
echo ""
sudo mkdir /opt/Notepad-Browser

mv Notepad-Browser /opt/Notepad-Browser/Notepad-Browser

cd /opt/Notepad-Browser/
sudo chmod 777 -R /opt/Notepad-Browser/
cd Notepad-Browser
sudo chmod 777 -R /opt/Notepad-Browser/Notepad-Browser/all/

echo "Configuração dos .conf"
echo ""

touch /etc/apache2/sites-available/file.notepad.conf
touch /etc/apache2/sites-available/create.notepad.conf
touch /etc/apache2/sites-available/link.notepad.conf



if grep -r '<VirtualHost *:80>' /etc/apache2/sites-available/file.notepad.conf
  then echo "[ok]"
  else
	 echo "escrevendo no arquivo"
	 echo "<VirtualHost *:80>" >> "/etc/apache2/sites-available/file.notepad.conf"
	 echo "    ServerAdmin admin@example.com" >> "/etc/apache2/sites-available/file.notepad.conf"
	 echo "    ServerName file.notepad" >> "/etc/apache2/sites-available/file.notepad.conf"
	 echo "    ServerAlias file.notepad" >> "/etc/apache2/sites-available/file.notepad.conf"
         echo "    DocumentRoot /opt/Notepad-Browser/Notepad-Browser/file/" >> "/etc/apache2/sites-available/file.notepad.conf"
	 echo "    ErrorLog ${APACHE_LOG_DIR}/error.log" >> "/etc/apache2/sites-available/file.notepad.conf"
	 echo "    CustomLog ${APACHE_LOG_DIR}/access.log combined" >> "/etc/apache2/sites-available/file.notepad.conf"
	 echo "</VirtualHost>" >> "/etc/apache2/sites-available/file.notepad.conf"
fi


if grep -r '<VirtualHost *:80>' /etc/apache2/sites-available/create.notepad.conf
  then echo "[ok]"
  else
	 echo "escrevendo no arquivo"
	 echo "<VirtualHost *:80>" >> "/etc/apache2/sites-available/create.notepad.conf"
	 echo "    ServerAdmin admin@example.com" >> "/etc/apache2/sites-available/create.notepad.conf"
	 echo "    ServerName create.notepad" >> "/etc/apache2/sites-available/create.notepad.conf"
	 echo "    ServerAlias create.notepad" >> "/etc/apache2/sites-available/create.notepad.conf"
         echo "    DocumentRoot /opt/Notepad-Browser/Notepad-Browser/text/" >> "/etc/apache2/sites-available/create.notepad.conf"
	 echo "    ErrorLog ${APACHE_LOG_DIR}/error.log" >> "/etc/apache2/sites-available/create.notepad.conf"
	 echo "    CustomLog ${APACHE_LOG_DIR}/access.log combined" >> "/etc/apache2/sites-available/create.notepad.conf"
	 echo "</VirtualHost>" >> "/etc/apache2/sites-available/create.notepad.conf"
fi


if grep -r '<VirtualHost *:80>' /etc/apache2/sites-available/link.notepad.conf
  then echo "[ok]"
  else
	 echo "escrevendo no arquivo"
	 echo "<VirtualHost *:80>" >> "/etc/apache2/sites-available/link.notepad.conf"
	 echo "    ServerAdmin admin@example.com" >> "/etc/apache2/sites-available/link.notepad.conf"
	 echo "    ServerName link.notepad" >> "/etc/apache2/sites-available/link.notepad.conf"
	 echo "    ServerAlias link.notepad" >> "/etc/apache2/sites-available/link.notepad.conf"
         echo "    DocumentRoot /opt/Notepad-Browser/Notepad-Browser/link/" >> "/etc/apache2/sites-available/link.notepad.conf"
	 echo "    ErrorLog ${APACHE_LOG_DIR}/error.log" >> "/etc/apache2/sites-available/link.notepad.conf"
	 echo "    CustomLog ${APACHE_LOG_DIR}/access.log combined" >> "/etc/apache2/sites-available/link.notepad.conf"
	 echo "</VirtualHost>" >> "/etc/apache2/sites-available/link.notepad.conf"
fi


if grep -r 'Notepad-Browser' /etc/apache2/apache2.conf
  then echo "[ok]"
  else
	 echo "escrevendo no arquivo"
	 echo "<Directory /opt/Notepad-Browser/Notepad-Browser/>" >> "/etc/apache2/apache2.conf"
	 echo "        Options Indexes FollowSymLinks" >> "/etc/apache2/apache2.conf"
	 echo "        AllowOverride None" >> "/etc/apache2/apache2.conf"
         echo "        Require all granted" >> "/etc/apache2/apache2.conf"
	 echo "</Directory>" >> "/etc/apache2/apache2.conf"
fi

if grep -r 'create.notepad' /etc/hosts
  then echo "[ok]"
  else  echo "127.0.0.1   create.notepad" >> "/etc/hosts"
fi

if grep -r 'link.notepad' /etc/hosts
  then echo "[ok]"
  else  echo "127.0.0.1   link.notepad" >> "/etc/hosts"
fi


if grep -r 'file.notepad' /etc/hosts
  then echo "[ok]"
  else echo "127.0.0.1   file.notepad" >> "/etc/hosts"
fi

echo "Ativando a .conf"
echo ""

sudo a2ensite file.notepad.conf
sudo a2ensite create.notepad.conf
sudo a2ensite link.notepad.conf


sudo service apache2 restart

echo "Link simbólico"
echo ""

echo "Nome de usuário da sua conta:"
read varname

ln -s /opt/Notepad-Browser/Notepad-Browser/all/  /home/$varname/Files

echo "Fim da instalação - se tudo ocorreu bem"
echo ""
echo "http://file.notepad/__doc__/nota.html"
echo ""
echo "Obrigada por instalar Notepad-Browser"
echo ""
echo "Todos os direitos reservados"
echo ""
