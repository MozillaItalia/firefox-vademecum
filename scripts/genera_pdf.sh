#!/usr/bin/env bash
#author: Simone Massaro (mone27)
#date: 15/05/18
#this scripts takes html file converts to single pdf pages and then merges the pages
#and try to install all dependencies (tested on ubuntu)
#now paths are hardcoded for firefox-vademecum repository
if ! [ -x "$(command -v html-pdf)" ]; then
  echo 'html-pdf not installed installing..'
  if ! [ -x "$(command -v npm)" ]; then
    echo "npm not installed. Installing..."
    curl https://www.npmjs.org/install.sh | sh
  fi
  npm install html-pdf
fi
html-pdf ../html/volantino_fronte.html ../volantino/volantino_fronte.pdf
html-pdf ../html/volantino_retro.html ../volantino/volantino_retro.pdf
echo "generated pdf files. merging.."

if ! [ -x "$(command -v pdftk)" ]; then
  if ! [ -x "$(command -v apt)" ]; then
    echo "platform non supported install pdftk for your distribution the try again"
  fi
  sudo apt install pdftk
fi
cd ../volantino
pdftk volantino_fronte.pdf volantino_retro.pdf cat output "Vademecum-$(date +"%Y_%m_%d_%I_%M").pdf"
