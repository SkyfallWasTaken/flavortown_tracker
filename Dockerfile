FROM rust:1-slim AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    pkg-config \
    libssl-dev \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN useradd -u 1000 -m builder
RUN mkdir -p /usr/src/app && chown builder:builder /usr/src/app
USER builder
WORKDIR /usr/src/app

COPY --chown=builder:builder Cargo.toml Cargo.lock ./

COPY --chown=builder:builder . .
RUN cargo build --release --locked

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN useradd -u 1000 -m appuser
USER appuser
WORKDIR /app

COPY --from=builder /usr/src/app/target/release/flavortown_tracker /app/flavortown_tracker
COPY --chown=appuser:appuser scripts/run-every-5min.sh /app/run-every-5min.sh
RUN chmod +x /app/run-every-5min.sh

EXPOSE 8080

ENTRYPOINT ["/app/run-every-5min.sh"]
