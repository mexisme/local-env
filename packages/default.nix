{ pkgs,
  callPackage,
  ...
}:

# Import the local packages, and export them via a new attrset:
let
  aws-cloud-tools = callPackage ./aws-cloud-tools { };
  dev-tools = callPackage ./dev-tools { };
  git = callPackage ./git { };
  java = callPackage ./java { };
  javascript = callPackage ./javascript { };
  terraform = callPackage ./terraform { };

  packages = {
    buildNpmPackage = callPackage ./build-npm-package { };

    python-with-packages = callPackage ./python-with-packages { };
    serverless = callPackage ./serverless { };
    nestjs = callPackage ./nestjs { };
  };

in packages // aws-cloud-tools // dev-tools // git // java // javascript // terraform
