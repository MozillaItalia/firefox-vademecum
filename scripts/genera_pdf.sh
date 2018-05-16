#!/usr/bin/env bash
#author: Simone Massaro (mone27)
#date: 15/05/18
#last update: 16/15/18 || by: @Sav22999
#this scripts takes html file converts to single pdf pages and then merges the pages
#and try to install all dependencies (tested on ubuntu)
#now paths are hardcoded for firefox-vademecum repository
#UPDATE the "version" and "type_version" variables and, if necessary, the "name" variable
name="Vademecum"
version="2.0"
type_version="VG"
#type_version={"VG"|"VT"}
if ! [ -x "$(command -v html-pdf)" ]; then
  echo "html-pdf not installed. installing..."
  if ! [ -x "$(command -v npm)" ]; then
    echo "npm not installed. installing..."
    curl https://www.npmjs.org/install.sh | sh
  fi
  npm install html-pdf
fi
html-pdf ../html/volantino_fronte.html ../volantino/volantino_fronte.pdf
html-pdf ../html/volantino_retro.html ../volantino/volantino_retro.pdf
echo "pdf files generated. merging in a single file..."

if ! [ -x "$(command -v pdftk)" ]; then
  if ! [ -x "$(command -v apt)" ]; then
    echo "platform doesn't support the installation pdftk for your distribution. so, try again."
  fi
  sudo apt install pdftk
fi
cd ../volantino
pdftk volantino_fronte.pdf volantino_retro.pdf cat output "${name}_${version}_${type_version}-$(date +"%Y_%m_%d_%I_%M").pdf"