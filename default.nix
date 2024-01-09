{ callPackage,
  buildEnv,
}:

let
  packages = callPackage ./packages { };
  inherit (packages) aws-all git-all jdk-19 nodejs-18 python-with-packages serverless terraform-versions nix-ld;

in buildEnv {
  # pathsToLink ignoreCollisions postBuild;
  extraOutputsToInstall = [];

  name = "all-packages";
  paths = [
    # This is a .so-resolver for Nix, that will allow binaries depending on the FHS to run with .so binaries stored in the Nix store:
    # envfs
    nix-ld

    aws-all
    git-all
    jdk-19
    nodejs-18
    python-with-packages
    terraform-versions
    serverless
  ];
}
