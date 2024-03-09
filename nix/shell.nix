{ pkgs }:
pkgs.mkShell {
  packages = with pkgs;
    [
      rustToolchain
      openssl
      pkg-config
      cargo-deny
      cargo-edit
      cargo-watch
      rust-analyzer
      crate2nix
    ];
}
