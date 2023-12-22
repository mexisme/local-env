{ buildNpmPackage,
  callPackage,
  ...
}:

let
  javascript = callPackage ../../packages/javascript { };

in
# We're overriding this, to fully control the version of Node being used:
buildNpmPackage.override { nodejs = javascript.nodejs-18; }
