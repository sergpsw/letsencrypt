
#!/bin/bash

scp /var/www/letsencrypt/nginx/default /var/www/letsencrypt/nginx/nginx.conf /var/www/letsencrypt/letsencrypt.sh $1E@$2E:/var/www/$1
ssh $1@$2


