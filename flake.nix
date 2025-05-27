{
  description = "Demo: Polyglot Hello World with Nix Flakes";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          name = "polyglot-dev-shell";
          buildInputs = [
            pkgs.python311
            pkgs.nodejs_20
            pkgs.go
            pkgs.rustc
            pkgs.cargo
          ];
          shellHook = ''
            echo "Nix shell ready! Python, Node, Go, Rust are available."
          '';
        };
      }
    );
}

