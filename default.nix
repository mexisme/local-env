{ callPackage,
  buildEnv,
}:

let
  packages = callPackage ./packages { };
  inherit (packages) aws-all git-all java-19 nodejs-18 python-with-packages serverless terraform-versions;

in buildEnv {
  # pathsToLink ignoreCollisions postBuild;
  extraOutputsToInstall = [];

  name = "all-packages";
  paths = with pkgs; [
    aws-all
    git-all
    java-19
    nodejs-18
    python-with-packages
    terraform-versions
    serverless
  ];
}
