#!/bin/bash

# ============================================
# Script: archive-logs.sh
# But: Archiver les anciens logs
# Auteur: BAJADDA ASMA
# Date: 29/03/2026
# ============================================

echo " Archivage des logs..."

# Je crée un nom d'archive avec la date du jour
# $(date +%Y%m%d) = par exemple 20260329
ARCHIVE_NAME="logs_$(date +%Y%m%d_%H%M%S).tar.gz"

# Je compresse tout le dossier logs
tar -czf $ARCHIVE_NAME logs/

if [ $? -eq 0 ]; then
    echo "✅ Archive créée : $ARCHIVE_NAME"
    echo "   Taille : $(du -h $ARCHIVE_NAME | cut -f1)"

    # Optionnel : vider les logs après archivage
    echo "   Pour vider les logs : > logs/app.log"
else
    echo " Échec de l'archivage"
fi