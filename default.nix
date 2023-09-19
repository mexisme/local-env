{ callPackage,
  buildEnv,
}:

let
  packages = callPackage ./packages { };
  inherit (packages) aws-cloud-tools git java node python-with-packages serverless terraform;

in buildEnv {
  # pathsToLink ignoreCollisions postBuild;
  extraOutputsToInstall = [];

  name = "all-packages";
  paths = [
    aws-cloud-tools.cdk
    aws-cloud-tools.cli
    git.all
    java.v19
    node.v18
    python-with-packages
    terraform.latest
    terraform.versions
    serverless
  ];
}
