{
  description = "Heading for the Yocto Project Development Environment";

  inputs = {
    nixpkgs.url = "nixpkgs/release-22.05";
    flake-utils.url = "github:numtide/flake-utils";
    devshell = {
      url = "github:numtide/devshell";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import inputs.nixpkgs {
        inherit system;

        overlays = [ inputs.devshell.overlay ];
      };

      gems = pkgs.bundlerEnv {
        name = "book";
        gemdir = ./.;
      };
    in
    {
      devShell = pkgs.devshell.mkShell {
        name = "Heading for the Yocto Project Development Environment";
        packages = with pkgs; [
          bundix

          gems
          (lowPrio gems.wrappedRuby)

          statix

          # Avoid the need of installation in the host.
          nix-direnv
        ];
      };
    }
  );
}
