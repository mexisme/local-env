{ callPackage, ... }:

# Import the local packages, and export them via a new attrset:
let
  aws-cloud-tools = callPackage ./aws-cloud-tools { };
  git = callPackage ./git { };
  node = callPackage ./node { };
  terraform = callPackage ./terraform { };

  packages = {
    buildNpmPackage = callPackage ./build-npm-package { };

    python-with-packages = callPackage ./python-with-packages { };
    serverless = callPackage ./serverless { };
  };

in packages // aws-cloud-tools // git // node // terraform
