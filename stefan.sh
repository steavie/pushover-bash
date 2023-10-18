#!/bin/bash

# Laden der Konfigurationsdatei
source ~/.pushover/pushover-config

# Argumente verarbeiten
while getopts "t:u:" opt; do
  case $opt in
    t)
      API_TOKEN="$OPTARG"
      ;;
    u)
      USER_KEY="$OPTARG"
      ;;
    \?)
      echo "Ungültige Option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done
shift $((OPTIND-1))

# Textnachricht aus den übrigen Argumenten extrahieren
MESSAGE="$@"

# Überprüfen, ob API-Token und Benutzer-Schlüssel vorhanden sind
if [ -z "$API_TOKEN" ] || [ -z "$USER_KEY" ]; then
  echo "API-Token und Benutzer-Schlüssel müssen angegeben werden."
  exit 1
fi

# Pushover API-URL
PUSHOVER_URL="https://api.pushover.net/1/messages.json"

# Senden der Nachricht an die Pushover API
curl -s -X POST $PUSHOVER_URL -d "token=$API_TOKEN" -d "user=$USER_KEY" -d "message=$MESSAGE"

echo "Nachricht gesendet."

