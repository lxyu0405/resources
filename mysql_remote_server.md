## mysql remote server 配置

### Step 1
Default, mysql would only allow access from the localhost address 127.0.0.1. 更新mysql配置文件`/etc/mysql/mysql.conf.d/mysqld.conf`

```python
from bind-address = 127.0.0.1
to bind-address = 0.0.0.0 or comment with '#'
```

### Step 2
在服务器端开启远程访问

* 首先进入mysql数据库，然后输入下面两个命令：

```mysql
grant all privileges on *.* to 'root'@'%' identified by 'password';
flush privileges;
```
* 第一个*是数据库，可以改成允许访问的数据库名称
* 第二个* 是数据库的表名称，*代表允许访问任意的表
* root代表远程登录使用的用户名，可以自定义
* %代表允许任意ip登录，如果你想指定特定的IP，可以把%替换掉就可以了
* password代表远程登录时使用的密码，可以自定义
* flush privileges;这是让权限立即生效

### Step 3
开放端口3306

```zsh
sudo ufw allow 3306
```