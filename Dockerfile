FROM ubuntu:24.04

RUN apt update && apt install -y cmake g++ make

WORKDIR /app
COPY . .

RUN cmake -S . -B build
RUN cmake --build build

CMD ["./build/demo"]
