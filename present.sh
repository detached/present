#! /bin/bash

MD=$1
TEMPLATE="./template.revealjs"
THEME="beige"
TRANSITION="concave"

if [ -z $MD ]; then
    echo "Error: missing parameter"
    echo "./present.sh FILE"
    exit 1
fi

if [ ! -d "./reveal.js" ]; then
    echo "Cloning reveal.js"
    git clone https://github.com/hakimel/reveal.js.git
fi

echo "=> Build $MD"
echo "    template:$TEMPLATE"
echo "    theme:$THEME"
echo "    transition:$TRANSITION"

pandoc -i -s --template=$TEMPLATE -t revealjs --variable theme="$THEME" --variable transition="concave" -s $MD -o $MD.html

if [ $? -eq 0 ]; then
    echo "=> Open in Browser"
    xdg-open slides.html
else 
    exit 1
fi
