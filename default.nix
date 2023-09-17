{ pkgs,
  callPackage,
  buildEnv,
}:

let
  packages = callPackage ./packages { };
  inherit (packages) aws-cloud-tools git-pr-train python-with-packages serverless;

in buildEnv {
  # pathsToLink ignoreCollisions postBuild;
  extraOutputsToInstall = [];

  name = "all-packages";
  paths = with pkgs; [
    aws-cloud-tools.cdk
    aws-cloud-tools.cli
    git-pr-train
    python-with-packages
    terraform-versions
    terragrunt
    serverless
  ];
}
