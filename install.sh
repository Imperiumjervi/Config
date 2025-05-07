#!/bin/bash 

echo "Instalando configuracion de neovim"

#Destino
NVIM_CONFIG=$HOOME/.config/nvim 

if [ -d "$NVIM_CONFIG"]; then
  BACKUP_DIR="$HOME/.config/nvim-backup-$(date +%Y%m%d%H%M%S)"
  echo "El directorio de configuracion de neovim ya existe. Haciendo copia de seguridad en $BACKUP_DIR"
  mv "$NVIM_CONFIG" "$BACKUP_DIR"
fi

mkdir -p "$NVIM_CONFIG"

cp -r ./nvim/* $NVIM_CONFIG

echo "Configuracion de neovim instalada en $NVIM_CONFIG"
