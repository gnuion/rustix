{
  description = "A Nix-flake-based Rust development environment";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, rust-overlay }:
    let
      overlays = [
        rust-overlay.overlays.default
        (final: prev: {
          rustToolchain = let rust = prev.rust-bin; in rust.fromRustupToolchainFile ./rust-toolchain.toml;
        })
      ];
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit overlays system; };
      });
    in
    {
      packages = forEachSupportedSystem
        ({ pkgs }:
          let
            cargoNix = pkgs.callPackage ./Cargo.nix { };
            packagesList = [ "my-app-storage" "my-app-core" "my-app-auth" ];
            packagesMap = builtins.foldl' (acc: elem: acc // { "${elem}" = cargoNix.workspaceMembers."${elem}".build; }) { } packagesList;
            all = pkgs.symlinkJoin {
              name = "all";
              paths = builtins.attrValues packagesMap;
            };
          in
          packagesMap // { default = all; }
        ); # end packages

      containers = forEachSupportedSystem
        ({ pkgs }:
          pkgs.callPackage ./containers.nix { }
        ); # end containers

      devShells = forEachSupportedSystem ({ pkgs }: {
        default = import ./nix/shell.nix {
          inherit pkgs;
        };
      }); # end devShells
    };
}





