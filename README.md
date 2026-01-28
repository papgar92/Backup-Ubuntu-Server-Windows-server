# Backup automático Ubuntu > Windows


[![Bash](https://img.shields.io/badge/Bash-5.1-green?logo=bash)](https://bash.org)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04-orange?logo=ubuntu)](https://ubuntu.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Script **Bash listo para produccion** :
- Copia backup FTP diario
- Lo mueve a **Windows Servidor Dominio** vía CIFS
- **Mantiene SOLO el más reciente** (borra todos los anteriores)
- Cron **2AM diario** con logs completos


## ✨ Características
-  Auto-monta CIFS si falla (`sudo mount -a`)
- **Elimina backups anteriores** (`ls -t | tail -n +2 | xargs rm`)
- Logs con timestamp (`/home/user/log_backup.txt`)
- Manejo errores (exit si no monta)
- Soporta nombres con espacios/timestamps

# Pre-requisitos (CIFS Obligatorio)

### 1. Instalar y configurar Cliente CIFS
```bash
sudo apt update && sudo apt install cifs-utils -y
sudo cp fstab.example /etc/fstab.backup  # Backup plantilla
sudo nano /etc/fstab
//IP_DESTINO/Carpeta\\040de\\040Destino/Backups\\040desde\\040Ubuntu /mnt/copias_seguridad cifs credentials=/etc/samba/credenciales_backup,iocharset=utf8,file_mode=0777,dir_mode=0777,noperm 0 0

sudo mkdir -p /etc/samba
sudo cp credentials.example /etc/samba/credenciales_backup
sudo nano /etc/samba/credenciales_backup  # Edita con datos REALES
sudo chmod 600 /etc/samba/credenciales_backup

username=DOMAIN\usuario
password=TuContraseña
domain=DominioLocal

sudo mkdir -p /mnt/copias_seguridad
sudo mount -a
mount | grep copias_seguridad  # Muestra CIFS montado
df -h /mnt/copias_seguridad    # Ver espacio en Windows

# Clonar repo y hacer ejecutable
git clone https://github.com/papgar92/Backup-Ubuntu-Server-Windows-server
cd Backup-Ubuntu-Server-Windows-server

chmod +x backup.sh


sudo crontab -e



