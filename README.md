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

sudo apt update && sudo apt install cifs-utils -y
sudo nano /etc/fstab
## Añadir al final 
# Carpeta de red Wn Windows Server
//IP_DESTINO/Carpeta\\040de\\040Destino/Backups\\040desde\\040Ubuntu /mnt/copias_seguridad cifs credentials=/etc/samba/credenciales_backup,iocharset=utf8,file_mode=0777,dir_mode=0777,noperm 0 0

### 2. Credenciales SMB
sudo cp credentials.example /etc/samba/credenciales_backup
sudo nano /etc/samba/credenciales_backup  # Editamos REAL
sudo chmod 600 /etc/samba/credenciales_backup

## contenido
username=DOMAIN\usuario
password=TuContraseña
domain=DominioLocal


### 3. Probar montaje
sudo mkdir -p /mnt/copias_seguridad
sudo mount -a
mount | grep copias_seguridad 

# Instalacion. 

### 4. Instalacion
git clone https://github.com/papgar92/Backup-Ubuntu-Server-Windows-server
cd Backup-Ubuntu-Server-Windows-server
chmod +x backup.sh


# Guardar Logs
echo "$(date '+%Y-%m-%d %H:%M:%S') - Reemplazado: $NOMBRE_NUEVO" >> /home/xrdpuser/log_copia_sensdesk.txt

echo "Backup actualizado: $NOMBRE_NUEVO (anterior eliminado)"

