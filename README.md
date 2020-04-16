1. Clone this repo to your machine in folder /var/www/
    git@github.com:sergpsw/letsencrypt.git.
2. In file 'nginx/default' change all entry 'EXAMPLE' of name your domain.
3. Change your user_name and host_name (row 1,2 in file script_n.sh). 
4. Open the terminal in this folder and run file script_n.sh (enter command 'bash script_n.sh').
5. Wait until the server opens and  run file letsencrypt_n.sh (enter command 'bash letsencrypt_n.sh'). Will begin install...
6. Next you need to enter the your email and follow the instructions.
7. Next, you will be asked to select an editor, enter '2'. In the last line of the file that opens add new row, paste "0 2 16 */2 * /usr/bin/cronbot renew --post-hook "sudo service nginx reload" --force-renew". Then click: 'Ctrl+o', 'Enter', 'Ctrl+x'.

Created an entry in crontab, еo check this entry use the command 'sudo crontab -l'.
NOTE! This instruction works for nginx.
