1. Clone this repo to your machine in folder /var/www/
    git@github.com:sergpsw/letsencrypt.git.
2. Change the server name of your server name (file nginx/default in row 25).
3. Change your user_name and host_name (row 1,2 in file script_n.sh). 
4. Open the terminal in this folder and run file script_n.sh (enter command 'bash script_n.sh').
5. Wait until the server opens and  run file letsencrypt_n.sh (enter command 'bash letsencrypt_n.sh'). Will begin install certbot.
6. Next you need to enter the your email and follow the instructions.
7. Next, you will be asked to select an editor. In the last line of the file that opens, paste "0 2 16 */2 * /usr/bin/cronbot renew --post-hook "sudo service nginx reload" --force-renew".
8. To check the recording in crontab use the command 'sudo crontab -l'.
NOTE! This instruction works for nginx.
