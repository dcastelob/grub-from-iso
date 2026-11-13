#!/bin/bash
# Script para download de imamge leve pra rescue de ambiente

# Obtendo variáveis importantes
source /etc/default/grub-from-iso
DIR=$(dirname "${GRUB_ISO_PATH}")

if [ ! -s /var/iso/dsl-rescue.iso ]; then 
    echo "[INFO] Baixando iso do Damn Small Linux..."
    mkdir -m755 -p "${DIR}"
    curl --output "${DIR}"/dsl-rescue.iso https://www.damnsmalllinux.org/download/dsl-2024.rc7.iso
else 
    echo "[INFO] Imagem do dsl-rescue-iso encontrada!"
fi

