#!/bin/bash

# ============================================
# Script: healthcheck.sh
# But: Vérifier si l'application est en vie
# Auteur: BAJADDA ASMA
# Date: 29/03/2026
# ============================================

echo " Test de santé de l'application..."

# curl = outil pour faire des requêtes HTTP
# -s = mode silencieux (pas de barre de progression)
# -o /dev/null = jette la réponse
# -w "%{http_code}" = affiche uniquement le code HTTP
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8085/health)

# Je regarde le code HTTP retourné
if [ "$HTTP_CODE" -eq 200 ]; then
    echo " Application est en bonne santé (HTTP $HTTP_CODE)"
    exit 0
else
    echo " Application ne répond pas (HTTP $HTTP_CODE)"
    echo "   Vérifiez avec ./scripts/logs.sh"
    exit 1
fi