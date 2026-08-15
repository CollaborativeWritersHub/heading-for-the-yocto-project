{ pkgs, lib, ... }:
let
  gems = pkgs.bundlerEnv {
    name = "book";
    gemdir = ./.;
  };
in
pkgs.mkShellNoCC {
  packages = [
    gems
    (lib.lowPrio gems.wrappedRuby)

    pkgs.bundix
    pkgs.statix

    # Avoid the need of installation in the host.
    pkgs.nix-direnv
  ];
}
