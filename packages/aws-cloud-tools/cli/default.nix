{ pkgs,
  callPackage,
  buildEnv,
}:

let
  assume-role = callPackage ./assume-role.nix {};

in buildEnv {
  # pathsToLink ignoreCollisions postBuild;
  extraOutputsToInstall = [];

  name = "aws-cli";
  paths = with pkgs; [
    # This is ~250MB:
    awscli2
    # This is ~1MB:
    jq

    assume-role.assume-role-credentials
    assume-role.assume-role-sourced
  ];
}
