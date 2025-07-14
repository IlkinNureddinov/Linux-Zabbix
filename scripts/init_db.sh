#!/bin/bash
mysql -uzabbix -pzabbix zabbix < mysql/schema.sql
mysql -uzabbix -pzabbix zabbix < mysql/images.sql
mysql -uzabbix -pzabbix zabbix < mysql/data.sql

