# Pushover Bash Script
Ein Bash-Shell-Skript zum Senden von Pushover-Benachrichtigungen. Ein [Pushover-Konto](https://pushover.net/) ist erforderlich, um dieses Skript zu verwenden.

## Verwendung

```
usage: pushover.sh <apikey> <userkey> <message> [optionen]

  -t,  --token APIKEY        Der API-Schlüssel für deine Anwendung auf pushover.net
  -u,  --user USERKEY        Dein Benutzer-Schlüssel auf pushover.net
  -m,  --message MESSAGE     Die Nachricht, die gesendet werden soll; unterstützt HTML-Formatierung
  -a,  --attachment filename Das Bild, das du senden möchtest
  -T,  --title TITLE         Titel der Nachricht
  -d,  --device NAME         Kommagetrennte Liste der Geräte, die die Nachricht erhalten sollen
  -U,  --url URL             URL, die mit der Nachricht gesendet werden soll
       --url-title URLTITLE  Titel der URL
  -p,  --priority PRIORITY   Priorität der Nachricht
                               -2 - keine Benachrichtigung/Alarm
                               -1 - stille Benachrichtigung
                                0 - normale Priorität
                                1 - Umgehung der Ruhezeiten des Benutzers
                                2 - Bestätigung durch den Benutzer erforderlich
  -e,  --expire SECONDS      Ablaufzeit für Benachrichtigungen mit Priorität 2 festlegen (Standard 180)
  -r,  --retry COUNT         Wiederholungszeitraum für Benachrichtigungen mit Priorität 2 festlegen (Standard 30)
  -s,  --sound SOUND         Benachrichtigungston, der mit der Nachricht abgespielt wird
                               pushover - Pushover (Standard)
                               bike - Fahrrad
                               bugle - Trompete
                               cashregister - Registrierkasse
                               classical - Klassisch
                               cosmic - Kosmisch
                               falling - Fallen
                               gamelan - Gamelan
                               incoming - Eingehend
                               intermission - Pause
                               magic - Magisch
                               mechanical - Mechanisch
                               pianobar - Piano Bar
                               siren - Sirene
                               spacealarm - Weltraumalarm
                               tugboat - Schlepper
                               alien - Alien-Alarm (lang)
                               climb - Klettern (lang)
                               persistent - Beharrlich (lang)
                               echo - Pushover Echo (lang)
                               updown - Hoch Runter (lang)
                               none - Keine (stumm)
```

## Konfiguration
Konfigurationsdateien können in **/etc/pushover/pushover-config** oder im Home-Verzeichnis des Benutzers unter **$HOME/.pushover/pushover-config** abgelegt werden. Die Optionen werden in der Reihenfolge ihrer Wichtigkeit für den Standort verarbeitet.

1) Optionen in /etc/pushover/pushover-config werden zuerst verarbeitet.
2) Optionen in $HOME/.pushover/pushover-config werden als nächstes verarbeitet.
3) Befehlszeilenargumente überschreiben alle Konfigurationswerte.

Die Standardkonfiguration ist leer und enthält Folgendes:

```
api_token=
user_key=
device=
url=
url_title=
priority=
title=
sound=
```

**HINWEIS:** Wenn du einen Wert in /etc/default/ definiert hast und auch Überschreibungen in $HOME/.pushover/ vorhanden sind, dürfen alle leeren Optionen in $HOME/.pushover/ nicht in der Datei vorhanden sein. Zum Beispiel habe ich die folgende Konfiguration in /etc/default/

```
api_token=my-app-api-token
user_key=my-user-key
device=
url=
url_title="Ich möchte, dass alle URLs diesen Titel haben"
priority=
title="das ist ein generischer Titel"
sound=
```

Wenn ich nur **title** für einen bestimmten Benutzer überschreiben möchte, sieht die Konfiguration in $HOME/.pushover/ so aus:

```
title="Titel für spezifischen Benutzer"
```

## Beispiele
Eine einfache "Dies ist ein Test" Nachricht an alle Geräte senden, die die gespeicherte Konfiguration in **/etc/default/pushover-config** oder **$HOME/.pushover/pushover-config** verwendet.

```
pushover.sh -m "Dies ist ein Test"
```

Eine einfache "Dies ist ein Test" Nachricht an alle Geräte senden, die den angegebenen API-Schlüssel und Benutzer-Schlüssel verwenden.

```
pushover.sh -t token -u key -m "Dies ist ein Test"
```

Eine einfache "Dies ist ein Test" Nachricht mit dem Titel "Test Titel" an alle Geräte senden, die den angegebenen API-Schlüssel und Benutzer-Schlüssel verwenden.

```
pushover.sh -t token -u key -m "Dies ist ein Test" -T "Test Titel"
```

Eine einfache "Dies ist ein Test" Nachricht an die Geräte namens "Telefon" und "Heim Desktop" senden, die den angegebenen API-Schlüssel und Benutzer-Schlüssel verwenden.

```
pushover.sh -t token -u key -m "Dies ist ein Test" -d "Telefon,Heim Desktop"
```

Eine einfache "Dies ist ein Test" Nachricht an alle Geräte senden, die einen Link zu www.google.com mit dem Titel "Google" enthält, und den angegebenen API-Schlüssel und Benutzer-Schlüssel verwenden.

```
pushover.sh -t token -u key -m "Dies ist ein Test" -U "http://www.google.com" --url-title Google
```

Eine einfache "Dies ist ein Test" Nachricht mit hoher Priorität an alle Geräte senden, die den angegebenen API-Schlüssel und Benutzer-Schlüssel verwenden.

```
pushover.sh -t token -u key -m "Dies ist ein Test" -p 1
```

Eine einfache "Dies ist ein Test" Nachricht an alle Geräte senden, die den Ton einer Fahrradklingel als Benachrichtigungston verwenden, und den angegebenen API-Schlüssel und Benutzer-Schlüssel verwenden.

```
pushover.sh -t token -u key -m "Dies ist ein Test" -s bike
```

Eine einfache "Dies ist ein Test Pic" Nachricht an alle Geräte senden und das Bild mit der Nachricht senden.

```
pushover.sh -t token -u key -m "Dies ist ein Test Pic" -a /path/to/pic.jpg
```
