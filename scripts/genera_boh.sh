#!/usr/bin/env bash
# author: Simone Massaro (mone27)
# date: 15/05/18
# last update: 16/15/18 || by: @Sav22999
# this scripts takes html file converts to single pdf pages and then merges the pages
# and try to install all dependencies (tested on ubuntu)
# now paths are hardcoded for firefox-vademecum repository
# UPDATE, if it's necessary, the "name" variable

name="Vademecum"
echo "Version number (format: VV.VV): "
read version
echo "Version type {VG|VT}: "
read typeVersion

if ! [ -x "$(command -v wkhtmltopdf)" ]; then
  sudo apt install wkhtmltopdf
fi
wkhtmltopdf ../html/volantino_fronte.html ../volantino/volantino"_$typeVersion"_fronte.pdf
wkhtmltopdf ../html/volantino_retro.html ../volantino/volantino"_$typeVersion"_retro.pdf
echo "pdf files generated. merging in a single file..."

if ! [ -x "$(command -v pdftk)" ]; then
  if ! [ -x "$(command -v apt)" ]; then
    echo "The script does not support automatic installation of pdftk on your platform."\
	"Please install pdftk (https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/) then try again"
	exit 1
  fi
  sudo apt install pdftk
fi

pdftk ../volantino/volantino_fronte.pdf ../volantino/volantino_retro.pdf cat output ../volantino/"$name_$version_$typeVersion".pdf
