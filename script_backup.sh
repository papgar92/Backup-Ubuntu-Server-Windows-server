#!/bin/bash

# Rutas CORRECTAS
ORIGEN="/home/usuario/carpeta_origen"
DESTINO="/mnt/copias_seguridad"

# Verificar y montar destino
if ! mountpoint -q "$DESTINO" 2>/dev/null || [ ! -d "$DESTINO" ]; then
    echo "Montando $DESTINO..."
    sudo mount -a 2>/dev/null
fi

# Verificar montado
if ! mountpoint -q "$DESTINO" 2>/dev/null; then
    echo "ERROR: $DESTINO no disponible"
    exit 1
fi

# Backup HOY
ULTIMO=$(ls -t "$ORIGEN" | head -n 1)
FECHA=$(date +%F)
NOMBRE_NUEVO="backup_${FECHA}_${ULTIMO}"

# ELIMINAR backups anterior
cd "$DESTINO"
ls -t | tail -n +2 | xargs -I {} rm -f "{}" 2>/dev/null

# Copiar NUEVO backup
cp "$ORIGEN/$ULTIMO" "$DESTINO/$NOMBRE_NUEVO"

# Guardar Logs
echo "$(date '+%Y-%m-%d %H:%M:%S') - Reemplazado: $NOMBRE_NUEVO" >> /home/xrdpuser/log_copia_backup.txt

echo "Backup actualizado: $NOMBRE_NUEVO (anterior eliminado)"
