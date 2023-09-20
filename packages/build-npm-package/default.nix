{ buildNpmPackage,
  callPackage,
  ...
}:

let
  node = callPackage ../../packages/node { };

in
# We're overriding this, to fully control the version of Node being used:
buildNpmPackage.override { nodejs = node.nodejs-18; }
