#!/bin/bash

OS1=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
OS2=$(awk '/ID=/' /etc/*-release | sed 's/ID=//' | tr '[:upper:]' '[:lower:]')
if [[ "$OS1" == "ubuntu" || "$OS1" == "debian" ]]
  then
    if [[ `ps -acx|grep nginx|wc -l` > 0 ]]
      then
	sudo apt-get update
        sudo apt-get install software-properties-common
        sudo add-apt-repository ppa:certbot/certbot -y
        sudo apt-get update
        sudo apt-get install certbot python-certbot-nginx -y 
        echo -e "$1\na\nn\ny" | sudo certbot --nginx
        sudo cp -f nginx default /etc/nginx/sites-enabled/default
        sudo crontab -e
    elif [[ `ps -acx|grep apache|wc -l` > 0 ]]
      then
	sudo apt-get update
        sudo apt-get install software-properties-common
        sudo add-apt-repository ppa:certbot/certbot -y
        sudo apt-get update
        sudo apt-get install certbot python-certbot-apache -y
        echo "Install Apach !!!"
        echo -e "$1\na\nn\ny"  | sudo certbot --apache 
        sudo cp -f default-ssl.conf /etc/apache2/sites-available/default-ssl.conf
        sudo crontab -e
    else echo -e "Server not install!\n\n For install nginx can run:\n 1. sudo apt-get update\n 2. sudo apt-get install nginx -y\n\n For install apache can run:\n 1. sudo apt-get update\n 2. sudo apt-get install apache2 -y"
    fi

elif [[ "$OS2" == "centos" || "$OS2" == "redhat" ]]

  then
    if [[ `ls -a /etc |grep nginx` ]]
      then
	sudo yum -y install yum-utils
        sudo yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-RE$
        sudo yum install certbot python2-certbot-nginx -y
        echo -e "$1\na\nn\ny" | sudo certbot --nginx
        # sudo cp -f nginx.conf /etc/nginx.conf
        sudo crontab -e
    elif [[ `ls -a /etc |grep httpd` ]]
      then
	sudo yum update -y
	sudo yum -y install yum-utils
        sudo yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional
        sudo yum install certbot python2-certbot-apache
        echo -e "$1\na\nn\ny" | sudo certbot certonly --apache # && xdotool key KP_Enter
        # sudo cp - httpd.conf /etc/httpd/conf/httpd.conf
        sudo crontab -e
    else echo -e "Server not install!\n Fod install nginx can run:\n 1. sudo yum install epel-release -y\n 2. sudo yum update -y\n 3. sudo yum install nginx -y\n \n Fod install apache can run:\n 1. sudo yum update httpd -y\n 2. sudo yum install httpd -y"
    fi

else
  echo "Sorry, not working for your OS!"
fi

