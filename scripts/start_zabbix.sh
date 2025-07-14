#!/bin/bash

# start_zabbix.sh


echo "Starting MariaDB service..."
sudo systemctl start mariadb
if [ $? -ne 0 ]; then
  echo "Failed to start MariaDB!"
  exit 1
fi

echo "Starting Zabbix server service..."
sudo systemctl start zabbix-server
if [ $? -ne 0 ]; then
  echo "Failed to start Zabbix server!"
  exit 1
fi

echo "Starting Apache (httpd) service..."
sudo systemctl start httpd
if [ $? -ne 0 ]; then
  echo "Failed to start Apache httpd!"
  exit 1
fi

echo "All services started successfully."

# Services status
echo "Checking service statuses..."
sudo systemctl status mariadb --no-pager
sudo systemctl status zabbix-server --no-pager
sudo systemctl status httpd --no-pager

echo "Zabbix environment should now be up and running."

