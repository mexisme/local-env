{ pkgs,
  callPackage,
  buildEnv,
}:

let
  packages = callPackage ../../packages { };
  inherit (packages) aws-all git-all nestjs swc with-jdk-19 nix-ld;

in buildEnv {
  # pathsToLink ignoreCollisions postBuild;
  extraOutputsToInstall = [];

  name = "all-packages";
  paths = [
    nix-ld

    # Example, if you wanted to add some packages from upstream NixPkgs
    # pkgs.zsh
    aws-all
    git-all
    nestjs
    swc
    with-jdk-19
  ];
}
