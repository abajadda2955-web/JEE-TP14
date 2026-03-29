#!/bin/bash

# ============================================
# Script: stop.sh
# But: Arrêter l'application Spring Boot
# Auteur: BAJADDA ASMA
# Date: 29/03/2026
# ============================================

echo " Recherche du processus Spring Boot..."

# ps aux = liste tous les processus
# grep 'spring-boot:run' = filtre les processus Maven/Spring
# grep -v grep = exclut la ligne du grep lui-même
# awk '{print $2}' = extrait la deuxième colonne (le PID)
PID=$(ps aux | grep 'spring-boot:run' | grep -v grep | awk '{print $2}')

# Je vérifie si j'ai trouvé un PID
if [ -z "$PID" ]; then
    echo " Aucun processus Spring Boot trouvé."
    echo "   (L'application n'est peut-être pas en cours d'exécution)"
else
    # kill -9 = force l'arrêt du processus
    kill -9 $PID
    echo "✅ Processus $PID arrêté avec succès."
    echo "   Le port 8090 est maintenant libre."
fi