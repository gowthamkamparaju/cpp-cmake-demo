FROM ubuntu:24.04

RUN apt update && apt install -y \
    build-essential \
    cmake

WORKDIR /app

COPY . /app

RUN cmake -S . -B build
RUN cmake --build build

CMD ["./build/demo"]
