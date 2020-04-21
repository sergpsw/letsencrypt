
#!/bin/bash

scp /var/www/letsencrypt/nginx/default /var/www/letsencrypt/nginx/nginx.conf /var/www/letsencrypt/letsencrypt_n.sh $1E@$2E:~
ssh $1@$2


