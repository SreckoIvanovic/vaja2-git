#!/bin/bash

# Ta skripta preveri, ali se C++ program uspesno prevede.
# Test je namenjen preverjanju, da je izvorna koda sintakticno pravilna
# in da nastane izvedljiva datoteka.

set -e

echo "Prevajam program..."
g++ -std=c++17 -Wall -Wextra -pedantic main.cpp -o vaja2

echo "Preverjam, ali je nastala izvedljiva datoteka..."
if [ ! -f vaja2 ]; then
    echo "Izvedljiva datoteka vaja2 ni bila ustvarjena."
    exit 1
fi

echo "Test prevajanja je uspesno zakljucen."