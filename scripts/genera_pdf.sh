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
echo "Pdf files generating..."
wkhtmltopdf -B 0 -T 0 -L 0 -R 0 ../html/volantino_fronte_"$typeVersion".html ../volantino/"$name"_"$typeVersion"_fronte.pdf
wkhtmltopdf -B 0 -T 0 -L 0 -R 0 ../html/volantino_retro_"$typeVersion".html ../volantino/"$name"_"$typeVersion"_retro.pdf
echo "Pdf files generated."

echo "Png files generating..."
wkhtmltoimage --crop-w 992 ../html/volantino_fronte_"$typeVersion".html ../volantino/"$name"_"$typeVersion"_fronte.png
wkhtmltoimage --crop-w 992 ../html/volantino_retro_"$typeVersion".html ../volantino/"$name"_"$typeVersion"_retro.png
echo "Png files generated."

echo "Pdf files merging in a single pdf file..."
if ! [ -x "$(command -v poppler-utils)" ]; then
  if ! [ -x "$(command -v apt)" ]; then
    echo "The script does not support automatic installation of poppler-utils (pdfunite) on your platform."\
	"Please install poppler-utils (pdfunite) and then try again."
	exit 1
  fi
  sudo apt install poppler-utils
fi

pdfunite  ../volantino/"$name"_"$typeVersion"_fronte.pdf ../volantino/"$name"_"$typeVersion"_retro.pdf ../volantino/"$name"_"$version"_"$typeVersion".pdf
echo "Pdf merged correctly."
echo "Process successful."
