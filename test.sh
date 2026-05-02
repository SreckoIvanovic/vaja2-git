#!/bin/bash
# Ta skripta preveri, ali se C++ program uspesno prevede.
# Standard C++ se doloci z okoljsko spremenljivko CPP_STANDARD.
# Ce spremenljivka ni nastavljena, se uporabi C++17.
# Napake se izpisejo na standardni izhod za napake (stderr).

set -e

STANDARD=${CPP_STANDARD:-17}

echo "Prevajam program s standardom C++${STANDARD}..."

# Prevajanje programa. Napake prevajalnika gredo avtomatsko na stderr.
if ! g++ -std=c++${STANDARD} -Wall -Wextra -pedantic main.cpp -o vaja2; then
  echo "Prevajanje ni uspelo s standardom C++${STANDARD}." >&2
  exit 1
fi

echo "Preverjam, ali je nastala izvedljiva datoteka..."

if [ ! -f vaja2 ]; then
  echo "Izvedljiva datoteka vaja2 ni bila ustvarjena." >&2
  exit 1
fi

echo "Test prevajanja je uspesno zakljucen s standardom C++${STANDARD}."