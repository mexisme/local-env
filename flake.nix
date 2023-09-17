{
  description = "Koan Local-env Packages";

  nixConfig = {
    bash-prompt-prefix = "[Local-Env] ";
  };

  inputs = {
    nixpkgs.url = "nixpkgs/release-23.05";
    nix.url = "nix/2.13.2";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      # flake = {
      #   # Put your original flake attributes here.
      # };
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];
      perSystem = { config, pkgs, system, lib, ... }: {
        # This sets `pkgs` to a nixpkgs with allowUnfree option set.
        _module.args.pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          config.permittedInsecurePackages = [
            # This is required to be able to build Node 12.22.12 in //packages/node/v12.nix
            "nodejs-12.22.12"
          ];
        };

        packages = with pkgs; {
          default = callPackage ./. {};
        } // callPackage ./packages {};
      };
    };
}
