
USER_NAME=test
HOST_NAME=test.com

#!/bin/bash
scp /var/www/letsencrypt/nginx/default /var/www/letsencrypt/letsencrypt_n.sh $USER_NAME@$HOST_NAME:~
ssh $USER_NAME@$HOST_NAME


