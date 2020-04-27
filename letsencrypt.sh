
#!/bin/bash

set -e

OS1=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
if [[ "$OS1" == "ubuntu" || "$OS1" == "debian" ]]
  then
    if [[ `ps -acx|grep nginx|wc -l` > 0 ]]
      then
	apt-get update
        apt-get install software-properties-common
        add-apt-repository ppa:certbot/certbot -y
        apt-get update
        apt-get install certbot python-certbot-nginx -y 
        echo -e "$1\na\n2\ny\n" | certbot --nginx
        cp -f nginx default /etc/nginx/sites-enabled/default
        crontab -e
    elif [[ `ps -acx|grep apache|wc -l` > 0 ]]
      then
	apt-get update
        apt-get install software-properties-common
        add-apt-repository ppa:certbot/certbot -y
        apt-get update
        apt-get install certbot python-certbot-apache -y
        echo -e "$1\na\n2\ny\n"  | certbot --apache 
        cp -f default-ssl.conf /etc/apache2/sites-available/default-ssl.conf
        crontab -e
    else echo -e "Server not install!\n\n For install nginx can run:\n 1.  apt-get update\n 2.  apt-get install nginx -y\n\n For install apache can run:\n 1.  apt-get update\n 2.  apt-get install apache2 -y"
    fi

elif [[ "ls -a /etc | grep centos" || "ls -a /etc | grep redhat" ]]

  then
    if [[ `ls -a /etc |grep nginx` ]]
      then
	yum -y install yum-utils
        yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-RE$
        yum install certbot python2-certbot-nginx -y
        echo -e "$1\na\n2\ny\n" | certbot --nginx
        # cp -f nginx.conf /etc/nginx.conf
        crontab -e
    elif [[ `ls -a /etc |grep httpd` ]]
      then
	yum update -y
	yum -y install yum-utils
        yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional
        yum install wget -y
        yum install -y epel-release
        yum repolist
        yum install certbot python2-certbot-apache -y
        echo -e "$1\na\n2\ny\n" | certbot --apache
        # cp - httpd.conf /etc/httpd/conf/httpd.conf
        crontab -e
    else echo -e "Server not install!\n Fod install nginx can run:\n 1.  yum install epel-release -y\n 2.  yum update -y\n 3.  yum install nginx -y\n \n Fod install apache can run:\n 1.  yum update httpd -y\n 2.  yum install httpd -y"
    fi

else
  echo "Sorry, not working for your OS!"
fi

