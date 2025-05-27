# Hello Polyglot World with Nix

This project demonstrates Nix flakes for reproducible development environments.
It includes "hello world" programs in Python, Node.js, Go, and Rust.

## Usage

1. Enable flakes if not already:

   ```bash
   mkdir -p ~/.config/nix
   echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
   ```

2. nix develop

3. Run the demos:

python python/hello.py
node node/hello.js
go run go/hello.go
cargo run --manifest-path rust/Cargo.toml
