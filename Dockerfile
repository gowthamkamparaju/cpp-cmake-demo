# -------- Stage 1: Build --------
FROM ubuntu:24.04 AS builder

RUN apt update && apt install -y \
    build-essential \
    cmake

WORKDIR /app

COPY CMakeLists.txt .
COPY main.cpp .

RUN cmake -B build
RUN cmake --build build


# -------- Stage 2: Runtime --------
FROM ubuntu:24.04

WORKDIR /app

# Copy only compiled binary from builder stage
COPY --from=builder /app/build/demo ./demo

CMD ["./demo"]
