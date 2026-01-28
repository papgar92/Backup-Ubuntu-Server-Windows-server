# Backup automático Ubuntu > Windows (SMB/CIFS)


[![Bash](https://img.shields.io/badge/Bash-5.1-green?logo=bash)](https://bash.org)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04-orange?logo=ubuntu)](https://ubuntu.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Script **Bash listo para produccion** :
- Copia backup FTP diario
- Lo mueve a **Windows Servidor Dominio** vía CIFS
- **Mantiene SOLO el más reciente** (borra todos los anteriores)
- Cron **2AM diario** con logs completos


##  Características
* Montaje automático de unidades de red Windows (SMB) en Linux.
* Gestión de credenciales segura (permisos 600).
* Script de rotación (elimina antiguos -> copia nuevos).
* Logs de actividad para auditoría.

## ⚙️ Requisitos Previos

* **Origen:** Ubuntu 22.04 LTS (o superior).
* **Destino:** Windows Server o carpeta compartida en red (SMB).
* **Dependencias:**
    ```bash
    sudo apt update
    sudo apt install -y cifs-utils rsync
    ```

## 🚀 Instalación y Configuración

### 1. Configuración de Credenciales
Creamos un archivo de credenciales protegido:

```bash
sudo nano /etc/samba/credenciales_sensdesk
````


















# Pre-requisitos (CIFS Obligatorio)

### 1. Instalar y configurar Cliente CIFS
```bash
sudo apt update && sudo apt install cifs-utils -y
```

### 2. Configurar /etc/fstab
```bash
sudo cp fstab.example /etc/fstab.backup  # Backup plantilla
sudo nano /etc/fstab
```
Añadir al final linea: 
//IP_DESTINO/Carpeta\\040de\\040Destino/Backups\\040desde\\040Ubuntu /mnt/copias_seguridad cifs credentials=/etc/samba/credenciales_backup,iocharset=utf8,file_mode=0777,dir_mode=0777,noperm 0 0

### 3. Credenciales SAMBA

```bash
sudo mkdir -p /etc/samba
sudo cp credentials.example /etc/samba/credenciales_backup
sudo nano /etc/samba/credenciales_backup  # Edita con tus datos REALES
sudo chmod 600 /etc/samba/credenciales_backup
```






sudo mkdir -p /mnt/copias_seguridad
sudo mount -a
mount | grep copias_seguridad  # Muestra CIFS montado
df -h /mnt/copias_seguridad    # Ver espacio en Windows

# Clonar repo y hacer ejecutable
git clone https://github.com/papgar92/Backup-Ubuntu-Server-Windows-server
cd Backup-Ubuntu-Server-Windows-server

chmod +x backup.sh


sudo crontab -e



