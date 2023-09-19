{ pkgs,
  callPackage,
  buildEnv,
}:

let
  packages = callPackage ./packages { };
  inherit (packages) aws-cloud-tools git node python-with-packages serverless terraform;

in buildEnv {
  # pathsToLink ignoreCollisions postBuild;
  extraOutputsToInstall = [];

  name = "all-packages";
  paths = with pkgs; [
    aws-cloud-tools.cdk
    aws-cloud-tools.cli
    git.all
    node.v18
    python-with-packages
    terraform.latest
    terraform.versions
    serverless
  ];
}
