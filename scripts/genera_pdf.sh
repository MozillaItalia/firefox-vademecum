#! /usr/bin/env bash
# this scripts takes html file converts to single pdf pages and then merges the pages
# and try to install all dependencies (tested on ubuntu and kubuntu)
# now paths are hardcoded for firefox-vademecum repository
# update manually, if it's necessary, the "name" variable
#usage version name typeVersion
set -e
version=${1-"2.0"}
name=${2-"Vademecum"}
typeVersion=${3-"VG"}

if ! [ -x "$(command -v wkhtmltopdf)" ]; then
  if ! [ -x "$(command -v apt)" ]; then
    echo "The script does not support automatic installation of wkhtmlpdf on your platform."\
	"Please install wkhtmltopdf and then try again."
	exit 1
  fi
  sudo apt install wkhtmltopdf
fi
echo "Pdf files generating..."
wkhtmltopdf -q -B 0 -T 0 -L 0 -R 0 ../html/volantino_fronte_"$typeVersion".html ../volantino/"$name"_"$version"_"$typeVersion"_fronte.pdf
wkhtmltopdf -q -B 0 -T 0 -L 0 -R 0 ../html/volantino_retro_"$typeVersion".html ../volantino/"$name"_"$version"_"$typeVersion"_retro.pdf
echo "Pdf files generated."

echo "Png files generating..."
wkhtmltoimage --crop-w 992 ../html/volantino_fronte_"$typeVersion".html ../volantino/"$name"_"$version"_"$typeVersion"_fronte.png
wkhtmltoimage --crop-w 992 ../html/volantino_retro_"$typeVersion".html ../volantino/"$name"_"$version"_"$typeVersion"_retro.png
echo "Png files generated."

echo "Pdf files merging in a single pdf file..."
if ! [ -x "$(command -v pdfunite)" ]; then
  if ! [ -x "$(command -v apt)" ]; then
    echo "The script does not support automatic installation of poppler-utils (pdfunite) on your platform."\
	"Please install poppler-utils (pdfunite) and then try again."
	exit 1
  fi
  sudo apt install poppler-utils
fi

pdfunite  ../volantino/"$name"_"$version"_"$typeVersion"_fronte.pdf ../volantino/"$name"_"$version"_"$typeVersion"_retro.pdf ../volantino/"$name"_"$version"_"$typeVersion".pdf
echo "Pdf merged correctly."
echo "Process successful."
