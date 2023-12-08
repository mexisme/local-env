{ pkgs }:

# - yarn2nix relies on builtins.filterSource, which is not supported by devenv.sh's lazy tree style, currently
#   - https://discord.com/channels/1036369714731036712/1150238319473602631/1150365614913900545
let
  packages = pkgs.callPackage ../../packages { };
  inherit (packages) buildNpmPackage;

in buildNpmPackage {
  name = "serverless-runner";
  version = "0.99.0";

  src = ./.;

  # If the "package-lock.json" needs updating, NPM Deps Hash can be calculated by running the following in this dir:
  #   nix run 'nixpkgs#prefetch-npm-deps' -- ./package-lock.json
  # ... and replacing the below SHA hash with the value output:
  npmDepsHash = "sha256-AN1H5+OF5Ev8fBOskQs6sgmkgiARn6TDvn0xT8l088c=";

  dontNpmBuild = true;
  npmInstallFlags = [ "--bin-links" ];

  nativeBuildPackages = with pkgs; [ zip ];
}
