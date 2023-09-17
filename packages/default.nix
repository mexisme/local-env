{ callPackage, ... }:

# Import the local packages, and export them via a new attrset:
{
  buildNpmPackage = callPackage ./build-npm-package { };
}
