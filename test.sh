#!/bin/bash

# Ta skripta preveri, ali se C++ program uspesno prevede in izvede.
# Najprej prevede main.cpp, nato pripravi vhodno datoteko,
# zazene program in preveri, ali je nastala izhodna datoteka out.txt.

set -e

echo "Prevajam program..."
g++ -std=c++17 -Wall -Wextra -pedantic main.cpp -o vaja2

echo "Pripravljam vhodno datoteko..."
echo "10 3 255 0 7 128 64 1" > vhod.txt

echo "Zaganjam program..."
./vaja2 0 vhod.txt

echo "Preverjam izhodno datoteko..."
if [ ! -f out.txt ]; then
    echo "Datoteka out.txt ni bila ustvarjena."
    exit 1
fi

echo "Vsebina out.txt:"
cat out.txt

echo "Test je uspesno zakljucen."