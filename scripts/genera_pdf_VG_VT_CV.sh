#!/bin/sh
# this scripts takes html file converts to single pdf pages and then merges the pages
# and try to install all dependencies (tested on ubuntu and kubuntu)
# now paths are hardcoded for firefox-vademecum repository
set -e
version=${1-"2.0"}
name=${2-"Vademecum"}

# Barbatrucco per trovare dove eseguire lo script, in modo da
# renderlo invocabile non solo da ./
# ToDo: gestire PATH con spazi

SCRIPT="$(readlink --canonicalize-existing "$0")"
SCRIPTPATH="$(dirname "$SCRIPT")"
cd "$SCRIPTPATH"

# da aggiungere anche "CV", pe generare la versione Common Voice
for i in "VG" "VT"
do
    typeVersion=$i;
    if [ $typeVersion = "VG" ]; then
        typeLongVersion="versione_generale"
    fi
    if [ $typeVersion = "VT" ]; then
        typeLongVersion="versione_tecnica"
    fi
    if [ $typeVersion = "CV" ]; then
        typeLongVersion="common_voice"
    fi
    echo "|| Starting conversion for "$typeLongVersion" ("$typeVersion") ||"
    if ! [ -x "$(command -v wkhtmltopdf)" ]; then
        if ! [ -x "$(command -v apt)" ]; then
            echo "The script does not support automatic installation of wkhtmlpdf on your platform."\
            "Please install wkhtmltopdf and then try again."
            exit 1
        fi
        sudo apt install wkhtmltopdf
    fi

    path_fronte="../"$typeLongVersion"_"$typeVersion"/html_e_css/volantino_fronte_"$typeVersion".html"
    path_retro="../"$typeLongVersion"_"$typeVersion"/html_e_css/volantino_retro_"$typeVersion".html"

    echo "Pdf files generating..."
    wkhtmltopdf -q -B 0 -T 0 -L 0 -R 0 $path_fronte "../volantino/pdf/"$name"_"$version"_"$typeVersion"_fronte.pdf"
    wkhtmltopdf -q -B 0 -T 0 -L 0 -R 0 $path_retro "../volantino/pdf/"$name"_"$version"_"$typeVersion"_retro.pdf"
    echo "Pdf files generated."

    echo "Png files generating..."
    wkhtmltoimage --crop-w 992 $path_fronte "../volantino/png/"$name"_"$version"_"$typeVersion"_fronte.png"
    wkhtmltoimage --crop-w 992 $path_retro "../volantino/png/"$name"_"$version"_"$typeVersion"_retro.png"
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

    pdfunite  "../volantino/pdf/"$name"_"$version"_"$typeVersion"_fronte.pdf" "../volantino/pdf/"$name"_"$version"_"$typeVersion"_retro.pdf" "../volantino/pdf/"$name"_"$version"_"$typeVersion".pdf"
    echo "Pdf merged correctly."
    
    echo "Temp files deleting..."
    rm "../volantino/pdf/"$name"_"$version"_"$typeVersion"_fronte.pdf"
    rm "../volantino/pdf/"$name"_"$version"_"$typeVersion"_retro.pdf"
    echo "Temp files deleted."
    echo "|| Completed conversion for version "$i" ||"
done
echo "|| Completed all conversions ||"

echo "------------------------"
echo "Details:\nNAME: "$name"\nVERSION: "$version"\nVERSION TYPES GENERATED:"
    for i in "VG" "VT"
    do
        echo "| "$i":"
        echo "| | "$name"_"$version"_"$i"_fronte.png"
        echo "| | "$name"_"$version"_"$i"_retro.png"
        echo "| | "$name"_"$version"_"$i".pdf"
    done
echo "------------------------"
