# Dockerfile za C++ konzolno aplikacijo.
# Uporabljen je multi-stage build, zato je koncna Docker slika majhna.
# V prvem koraku se na Alpine namesti g++ in program prevede.
# V koncno sliko gre samo izvedljiva datoteka in testna vhodna datoteka.

FROM alpine:3.20 AS build

WORKDIR /app

RUN apk add --no-cache g++

COPY main.cpp .

RUN g++ -std=c++17 -O2 main.cpp -o vaja2


FROM alpine:3.20

WORKDIR /app

COPY --from=build /app/vaja2 .

RUN echo "10 3 255 0 7 128 64 1" > vhod.txt

CMD ["./vaja2", "0", "vhod.txt"]