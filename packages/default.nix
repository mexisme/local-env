{ callPackage, ... }:

# Import the local packages, and export them via a new attrset:
{
  buildNpmPackage = callPackage ./build-npm-package { };

  aws-cloud-tools = callPackage ./aws-cloud-tools { };
  git = callPackage ./git { };
  java = callPackage ./java { };
  node = callPackage ./node { };
  python-with-packages = callPackage ./python-with-packages { };
  serverless = callPackage ./serverless { };
  terraform = callPackage ./terraform { };
}
