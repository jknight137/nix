#!/usr/bin/env bash
set -e

echo "=== Python ==="
python3 python/hello.py

echo -e "\n=== Node.js ==="
node node/hello.js

echo -e "\n=== Go ==="
go run go/hello.go

echo -e "\n=== Rust ==="
cargo run --manifest-path rust/Cargo.toml

echo -e "\n=== Kotlin ==="
cd kotlin
kotlinc Hello.kt -include-runtime -d Hello.jar
java -jar Hello.jar
rm -f Hello.jar
cd ..

echo -e "\n=== C# (.NET) ==="
cd csharp
dotnet build --nologo
dotnet run --no-build --nologo
cd ..

echo -e "\n=== All Demos Completed! ==="
