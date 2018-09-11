## VPS 启用子域名(Ubuntu16.04 + Nginx + LetsEncrypt)

### 环境
* VPS Provider: [Vultr](https://www.vultr.com/)
* Ubuntu 16.04
* Nginx

#### Step1. DNS管理中添加域名
* 完后通过ping来验证域名是否可通
* 例如：Vultr
* ![Vultr DNS Management](https://github.com/lxyu0405/resources/blob/update/images/vultr-dns-manage.png)

#### Step2. Nginx enable New Server
* copy [nginx default config](https://github.com/lxyu0405/resources/blob/update/nginx-default) to /etc/nginx/sites-available/, and give it a new name.
* Link to sites-enable folder
```zsh
> sudo cp nginx-default /etc/nginx/sites-available/site-test.conf
> cd /etc/nginx/sites-enable
> sudo ln -s /etc/nginx/sites-available/site-test.conf
```
* nano or vi for site-test.conf
	* server_name to new sub-domain
	* route change
	* Other useful config and plugins
* test nginx is ok and restart nginx
```zsh
> sudo nginx -t
> sudo systemctl restart nginx
```
* test the domain is accessible, if not, plz go Google for help.

#### Step3. Https for new domain
* If first time, go for this tutorial.  
	* [how-to-set-up-let-s-encrypt-with-nginx-server-blocks-on-ubuntu-16-04](https://www.digitalocean.com/community/tutorials/how-to-set-up-let-s-encrypt-with-nginx-server-blocks-on-ubuntu-16-04)
	* ![how-to-set-up-let-s-encrypt-with-nginx-server-blocks-on-ubuntu-16-04](https://github.com/lxyu0405/resources/blob/update/digitalocean-tutorials/letsencrypt-nginx.png)
* If add one more submain. Just
```zsh
> sudo certbot -d new-domain.com
```
* Verifying Certbot Auto-Renewal
```zsh
> sudo certbot renew --dry-run
```
