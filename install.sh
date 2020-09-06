#!/bin/bash
echo "Seu nome de usuário é:"
whoami

echo ""
echo "Instalador do Notepad-Browser"
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
sudo cp file.notepad.conf.exemplo /etc/apache2/sites-available/file.notepad.conf
sudo cp create.notepad.conf.exemplo /etc/apache2/sites-available/create.notepad.conf
sudo cp link.notepad.conf.exemplo /etc/apache2/sites-available/link.notepad.conf

sudo rm create.notepad.conf.exemplo
sudo rm link.notepad.conf.exemplo
sudo rm file.notepad.conf.exemplo


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

echo "Nome de usuário:"
read varname

ln -s /opt/Notepad-Browser/Notepad-Browser/all/  /home/$varname/Files

echo "Fim da instalação - se tudo ocorreu bem"
echo ""
echo "http://file.notepad"
echo ""
echo "Obrigada por instalar Notepad-Browser"
echo ""
echo "Todos os direitos reservados"
echo ""
