#!/bin/bash

# Ihre Pushover API-Token und Benutzer-/Gruppenschlüssel
API_TOKEN="aihxszv11yynt25ky2axeqb3xq8igp"
USER_KEY="uxdosvg6r2b54bp1oyhznt5mbd5r4b"

# Die Nachricht, die Sie senden möchten
MESSAGE="Ihre Nachricht hier"

# Pushover API-URL
PUSHOVER_URL="https://api.pushover.net/1/messages.json"

# Senden Sie die Nachricht an die Pushover API
curl -s -X POST $PUSHOVER_URL -d "token=$API_TOKEN" -d "user=$USER_KEY" -d "message=$MESSAGE"

# Überprüfen Sie die Antwort von Pushover (optional)
# Sie können die Antwort in einer Datei speichern oder sie anzeigen
# curl -s -X POST $PUSHOVER_URL -d "token=$API_TOKEN" -d "user=$USER_KEY" -d "message=$MESSAGE" -o response.txt
# cat response.txt
