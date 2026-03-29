#!/bin/bash

# ============================================
# Script: logs.sh
# But: Afficher les dernières lignes des logs
# Auteur: BAJADDA ASMA
# Date: 29/03/2026
# ============================================

echo " Affichage des 30 dernières lignes de logs :"
echo "================================================"

# Je vérifie si le fichier de logs existe
if [ -f "logs/app.log" ]; then
    # tail -n 30 = affiche les 30 dernières lignes
    tail -n 30 logs/app.log
else
    echo " Aucun fichier de logs trouvé."
    echo "   Lancez d'abord l'application avec ./scripts/run.sh"
fi

echo ""
echo "================================================"
echo " Pour voir les logs en continu : tail -f logs/app.log"