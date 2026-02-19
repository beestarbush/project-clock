FROM rust:1.85-bookworm

# Install Node.js, and build dependencies
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs pkg-config libssl-dev && \
    rm -rf /var/lib/apt/lists/*

# Install cargo-watch to handle auto-recompilation
RUN cargo install cargo-watch --version 8.5.2 --locked

WORKDIR /app

# We use a shell script to start both processes
# 1. Frontend: npm install then run dev
# 2. Backend: cargo watch (rebuilds on save)
CMD ["sh", "-c", "cd webapp && npm install && npm run dev -- --host & cd backend && cargo watch -x run"]

