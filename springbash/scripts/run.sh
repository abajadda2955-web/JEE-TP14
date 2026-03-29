#!/bin/bash

mkdir -p logs

echo " Démarrage de l'application Spring Boot sur le port 8090..."

# Je lance l'application avec le port personnalisé
nohup mvn spring-boot:run -Dspring-boot.run.arguments=--server.port=8088 > logs/app.log 2>&1 &

echo " Application démarrée avec succès (PID : $!)"
echo " Logs disponibles dans logs/app.log"
echo " Accès: http://localhost:8088"