{
  description = "Polyglot Hello World with Nix Flakes (Python, Node, Go, Rust, Kotlin, C#)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        # Individual derivations
        kotlin = pkgs.kotlin;
        jdk = pkgs.jdk17;
        dotnet = pkgs.dotnet-sdk_8;
      in {
        devShells.default = pkgs.mkShell {
          name = "polyglot-dev-shell";

          buildInputs = [
            pkgs.python311
            pkgs.nodejs_20
            pkgs.go
            pkgs.rustc
            pkgs.cargo
            kotlin
            jdk
            dotnet
          ];

          shellHook = ''
            export PATH=$PATH:${dotnet}/bin
            export PATH=$PATH:${jdk}/bin
            export PATH=$PATH:${kotlin}/bin
            echo "Nix shell ready: Python, Node, Go, Rust, Kotlin, C#"
          '';
        };
      }
    );
}
