#!/bin/sh
# Construit le site GitHub Pages autonome à partir des fichiers de l'artifact.
# Usage : sh build.sh <index.html de l'artifact> <data.js> [dossier de sortie]
set -e
IN="${1:?index.html requis}"; DATA="${2:?data.js requis}"; OUT="${3:-.}"
TITLE=$(grep -o '<title>[^<]*</title>' "$IN" | head -1)
[ -n "$TITLE" ] || TITLE='<title>Présidentielle 2027 · Observatoire Lisnard</title>'
TMP="$OUT/.index.tmp"
{ printf '<!doctype html>\n<html lang="fr">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n%s\n<meta name="description" content="Présidentielle 2027 : comparatif des programmes, sondages et opinions, centré sur David Lisnard. Mis à jour chaque jour.">\n<style>[hidden]{display:none!important}body{margin:0}img{max-width:100%%}</style>\n</head>\n<body>\n' "$TITLE"
  grep -v '<title>[^<]*</title>' "$IN"
  printf '\n</body>\n</html>\n'; } > "$TMP"
mv "$TMP" "$OUT/index.html"
cp "$DATA" "$OUT/data.js"
touch "$OUT/.nojekyll"
