# Zabbix Server Installation Guide (RHEL/CentOS 8/9)

This guide covers the full installation of Zabbix Server with MariaDB (MySQL) and Apache (httpd) on a RHEL-based system.

---

## 🛠️ Step 1: Install Required Packages

```bash
sudo dnf install -y epel-release
sudo dnf install -y mariadb mariadb-server
sudo dnf install -y httpd php php-mysqlnd php-fpm php-xml php-bcmath php-mbstring php-gd php-json php-ldap php-opcache php-intl php-common php-cli php-zip

## Step 2: Add Zabbix Repository and Install Zabbix Packages

# Add the Zabbix 6.0 LTS repo for RHEL 9
sudo rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/9/x86_64/zabbix-release-6.0-4.el9.noarch.rpm

# Clean the repo cache
sudo dnf clean all

# Install Zabbix server, frontend, and agent
sudo dnf install -y zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-sql-scripts zabbix-agent


##Step 3: Configure and Initialize the Database

systemctl enable --now mariadb

mysql_secure_installation

mysql -uroot -p


CREATE DATABASE zabbix CHARACTER SET utf8 COLLATE utf8_bin;
CREATE USER zabbix@localhost IDENTIFIED BY 'zabbix';
GRANT ALL PRIVILEGES ON zabbix.* TO zabbix@localhost;
FLUSH PRIVILEGES;
EXIT;


zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql -uzabbix -pzabbix zabbix


## Edit /etc/zabbix/zabbix_server.conf

DBPassword=zabbix

date.timezone = Asia/Baku

##  Enable and Start Services

systemctl enable --now zabbix-server zabbix-agent httpd php-fpm


##  Access Zabbix Web Interface


http://<your_server_ip>/zabbix


