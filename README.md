1. Clone this repo to your machine in folder /var/www/
    git@github.com:sergpsw/letsencrypt.git.
2. In files 'nginx/*' and 'apache/*' change all entry 'EXAMPLE' of name your domain.
3. Open the terminal in this folder and enter command 'bash script.sh USER_NAME HOST_NAME'.
4. Wait until the server opens and  enter command 'bash letsencrypt.sh mail@mail.com' (instead mail@mail.com indicate your email). Will begin install...
5. Next, you will be asked to select an editor, enter '2'. In the last line of the file that opens add new row, paste "0 2 16 */2 * /usr/bin/cronbot renew --post-hook "sudo service nginx reload" --force-renew". Then click: 'Ctrl+o', 'Enter', 'Ctrl+x'.

Created an entry in crontab, еo check this entry use the command 'sudo crontab -l'.
