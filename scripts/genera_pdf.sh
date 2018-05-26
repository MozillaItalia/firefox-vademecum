# this scripts takes html file converts to single pdf pages and then merges the pages
# and try to install all dependencies (tested on ubuntu and kubuntu)
# now paths are hardcoded for firefox-vademecum repository
# update manually, if it's necessary, the "name" variable

name="Vademecum"
echo "Version number (format: VV.VV): "
read version
echo "Version type {VG|VT}: "
read typeVersion

if ! [ -x "$(command -v wkhtmltopdf)" ]; then
  sudo apt install wkhtmltopdf
fi
echo "pdf files generating..."
wkhtmltopdf -B 0 -T 0 -L 0 -R 0 ../html/volantino_fronte.html ../volantino/"$name"' '"$typeVersion"' FRONTE.pdf'
wkhtmltopdf -B 0 -T 0 -L 0 -R 0 ../html/volantino_retro.html ../volantino/"$name"' '"$typeVersion"' RETRO.pdf'
echo "pdf files generated."

echo "png file generating..."
wkhtmltoimage --crop-w 992 ../html/volantino_fronte.html ../volantino/"$name"' '"$typeVersion"' 'FRONTE.png
wkhtmltoimage --crop-w 992 ../html/volantino_retro.html ../volantino/"$name"' '"$typeVersion"' 'RETRO.png
echo "png files generated."

echo "pdf files merging in a single pdf file..."
if ! [ -x "$(command -v pdftk)" ]; then
  if ! [ -x "$(command -v apt)" ]; then
    echo "The script does not support automatic installation of pdftk on your platform."\
	"Please install pdfunite (poppler-utils) and then try again."
	exit 1
  fi
  sudo apt install poppler-utils
fi

pdfunite  ../volantino/"$name"' '"$typeVersion"' FRONTE.pdf' ../volantino/"$name"' '"$typeVersion"' RETRO.pdf' ../volantino/"$name"' '"$version"' '"$typeVersion"'.pdf'
echo "pdf merged correctly."
echo "process successful."
