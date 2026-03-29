#!/bin/bash

# ============================================
# Script: deploy.sh
# But: Compiler et déployer l'application
# Auteur: BAJADDA ASMA
# Date: 29/03/2026
# ============================================

# Je crée le dossier logs s'il n'existe pas
mkdir -p logs

echo " Compilation du projet Spring Boot..."
echo "   (Cela peut prendre quelques secondes)"

# clean = supprime l'ancien build
# package = crée le fichier JAR
# -DskipTests = ne pas exécuter les tests (plus rapide)
mvn clean package -DskipTests

# Je vérifie si la compilation a réussi
if [ $? -eq 0 ]; then
    echo "✅ Compilation réussie !"

    # Je cherche le fichier JAR généré
    JAR_FILE=$(ls target/*.jar | grep -v 'sources' | head -1)

    echo " Déploiement de la nouvelle version..."
    echo "   Fichier: $JAR_FILE"

    # Je lance le JAR en arrière-plan
    nohup java -jar $JAR_FILE > logs/deploy.log 2>&1 &

    echo " Nouvelle version déployée avec succès (PID : $!)"
    echo " Logs de déploiement dans logs/deploy.log"
else
    echo " La compilation a échoué. Vérifiez votre code."
    exit 1
fi