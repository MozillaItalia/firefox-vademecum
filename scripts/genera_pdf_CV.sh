#!/bin/sh
# this scripts takes html file converts to single pdf pages and then merges the pages
# and try to install all dependencies (tested on ubuntu and kubuntu)
# now paths are hardcoded for firefox-vademecum repository
set -e
version=${1-"1.0"}
name=${2-"CommonVoice"}

for i in "CV"
do
    typeVersion=$i;
    typeLongVersion="common_voice";
    if [ $typeLongVersion == "VT" ]; then
        typeLongVersion="versione_tecnica";
    fi
    echo "|| Starting conversion for version "$typeVersion" ||"
    if ! [ -x "$(command -v wkhtmltopdf)" ]; then
        if ! [ -x "$(command -v apt)" ]; then
            echo "The script does not support automatic installation of wkhtmlpdf on your platform."\
            "Please install wkhtmltopdf and then try again."
            exit 1
        fi
        sudo apt install wkhtmltopdf
    fi
    echo "Pdf files generating..."
    wkhtmltopdf -q -B 0 -T 0 -L 0 -R 0 ../"$typeLongVersion"_"$typeVersione"/html+css/volantino_fronte_"$typeVersion".html ../"$typeLongVersion"_"$typeVersione"/output/"$name"_"$version"_"$typeVersion"_fronte.pdf
    wkhtmltopdf -q -B 0 -T 0 -L 0 -R 0 ../"$typeLongVersion"_"$typeVersione"/html+css/volantino_retro_"$typeVersion".html ../"$typeLongVersion"_"$typeVersione"/output/"$name"_"$version"_"$typeVersion"_retro.pdf
    echo "Pdf files generated."

    echo "Png files generating..."
    wkhtmltoimage --crop-w 992 ../"$typeLongVersion"_"$typeVersione"/html+css/volantino_fronte_"$typeVersion".html ../"$typeLongVersion"_"$typeVersione"/output/"$name"_"$version"_"$typeVersion"_fronte.png
    wkhtmltoimage --crop-w 992 ../"$typeLongVersion"_"$typeVersione"/html+css/volantino_retro_"$typeVersion".html ../"$typeLongVersion"_"$typeVersione"/output/"$name"_"$version"_"$typeVersion"_retro.png
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

    pdfunite  ../"$typeLongVersion"_"$typeVersione"/output/"$name"_"$version"_"$typeVersion"_fronte.pdf ../"$typeLongVersion"_"$typeVersione"/output/"$name"_"$version"_"$typeVersion"_retro.pdf ../"$typeLongVersion"_"$typeVersione"/"$name"_"$version"_"$typeVersion".pdf
    echo "Pdf merged correctly."
    
    echo "Temp files deleting..."
    rm ../"$typeLongVersion"_"$typeVersione"/output/"$name"_"$version"_"$typeVersion"_fronte.pdf
    rm ../"$typeLongVersion"_"$typeVersione"/output/"$name"_"$version"_"$typeVersion"_retro.pdf
    echo "Temp files deleted."
    echo "|| Completed conversion for version "$i" ||"
done
echo "|| Completed all conversions ||"

echo "\n------------------------"
echo "Details:\nNAME: "$name"\nVERSION: "$version"\nVERSION TYPES GENERATED:"
    for i in "CV"
    do
        echo "| "$i":"\
        "\n| | "$name"_"$version"_"$i"_fronte.png"\
        "\n| | "$name"_"$version"_"$i"_retro.png"\
        "\n| | "$name"_"$version"_"$i".pdf"
    done
echo "------------------------"
