#!/bin/bash 

echo "Instalando configuracion de neovim"

#Destino
NVIM_CONFIG=$HOOME/.config/nvim 

mkdir -p "$NVIM_CONFIG"

cp -r ./nvim/* $NVIM_CONFIG

echo "Configuracion de neovim instalada en $NVIM_CONFIG"
