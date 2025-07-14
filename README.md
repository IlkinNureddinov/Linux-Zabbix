# Zabbix Lab Project

## Project Structure

- `config/` — Zabbix server and web configuration files
- `mysql/` — MySQL schema and data SQL files
- `scripts/` — Helper bash scripts for initialization and management
- `docs/` — Documentation files
- `README.md` — This file

## Setup Instructions

1. Copy config files to `/etc/zabbix/` on your server.
2. Run the database initialization script:

```bash
bash scripts/init_db.sh

# Linux-Zabbix
