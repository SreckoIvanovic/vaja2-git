# Dockerfile za C++ konzolno aplikacijo.
# Slika vsebuje prevajalnik g++ in projektno kodo.
# Program se prevede med gradnjo Docker slike.

FROM gcc:13

WORKDIR /app

COPY . .

RUN g++ -std=c++17 -Wall -Wextra -pedantic main.cpp -o vaja2

RUN echo "10 3 255 0 7 128 64 1" > vhod.txt

CMD ["./vaja2", "0", "vhod.txt"]