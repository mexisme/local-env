{ pkgs,
  lib,
  buildEnv,
  callPackage,
}:

let
  # Include the standard / default packages:
  default = callPackage ./../.. { };

  packages = callPackage ../../packages { };
  inherit (packages) aws-cloud-tools terraform-versions;

in buildEnv {
  # pathsToLink ignoreCollisions postBuild;
  extraOutputsToInstall = [];

  name = "terraform-terragrunt-local-env";
  paths = with pkgs; [
    aws-cloud-tools.cli
    gitMinimal
    openssh
    terraform
    terraform-versions
    terragrunt
  ];
}
