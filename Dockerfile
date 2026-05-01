# Dockerfile za C++ konzolno aplikacijo.
# Uporabljen je multi-stage build, zato je koncna Docker slika majhna.
# GCC se uporabi samo za prevajanje, v DockerHub pa gre samo majhna koncna slika.

FROM gcc:13-alpine AS build

WORKDIR /app

COPY main.cpp .

RUN g++ -std=c++17 -O2 -static main.cpp -o vaja2


FROM alpine:3.20

WORKDIR /app

COPY --from=build /app/vaja2 .

RUN echo "10 3 255 0 7 128 64 1" > vhod.txt

CMD ["./vaja2", "0", "vhod.txt"]