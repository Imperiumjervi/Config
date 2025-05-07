#!/bin/bash

echo "Instalando configuración de Neovim..."

# Destino correcto
NVIM_CONFIG="$HOME/.config/nvim"

# Verificar si ya existe una configuración previa
if [ -d "$NVIM_CONFIG" ]; then
    BACKUP_DIR="$HOME/.config/nvim-backup-$(date +%Y%m%d_%H%M%S)"
    echo "Se encontró una configuración existente. Creando respaldo en $BACKUP_DIR"
    mv "$NVIM_CONFIG" "$BACKUP_DIR"
fi

# Crear el nuevo directorio
mkdir -p "$NVIM_CONFIG"

# Copiar archivos nuevos
cp -r ./nvim/* "$NVIM_CONFIG"

echo "Configuración de Neovim instalada correctamente en $NVIM_CONFIG"

