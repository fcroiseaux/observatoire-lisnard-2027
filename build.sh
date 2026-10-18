#!/bin/sh
# Construit le site autonome à partir des fichiers de l'artifact : $1 = index.html de l'artifact, $2 = data.js
set -e
IN="${1:-/home/claude/presidentielle/index.html}"; DATA="${2:-/home/claude/presidentielle/data.js}"; OUT="${3:-.}"
{ printf '<!doctype html>\n<html lang="fr">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n<meta name="description" content="Présidentielle 2027 : comparatif des programmes, sondages et opinions, centré sur David Lisnard. Mis à jour chaque jour.">\n<style>[hidden]{display:none!important}body{margin:0}img{max-width:100%%}</style>\n</head>\n<body>\n'; cat "$IN"; printf '\n</body>\n</html>\n'; } > "$OUT/index.html"
cp "$DATA" "$OUT/data.js"
touch "$OUT/.nojekyll"
