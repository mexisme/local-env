{ pkgs,
  callPackage,
  buildEnv,
}:

let
  packages = callPackage ../../packages { };
  inherit (packages) aws-all git-all nestjs with-jdk-19;

in buildEnv {
  # pathsToLink ignoreCollisions postBuild;
  extraOutputsToInstall = [];

  name = "all-packages";
  paths = [
    # Example, if you wanted to add some packages from upstream NixPkgs
    # pkgs.zsh
    aws-all
    git-all
    nestjs
    with-jdk-19
  ];
}
