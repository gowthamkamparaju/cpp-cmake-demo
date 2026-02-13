FROM ubuntu:24.04

RUN apt update && apt install -y \
    build-essential \
    cmake

WORKDIR /app

# Copy everything into working directory
COPY . .

# Debug (temporary – remove later if you want)
RUN echo "Files inside /app:"
RUN ls -la

# Build project
RUN cmake -S . -B build
RUN cmake --build build

CMD ["./build/demo"]
