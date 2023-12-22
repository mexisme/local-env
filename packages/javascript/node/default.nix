{ callPackage,
  nodejs-18_x,
}:

let
  nodejs-12 = callPackage ./v12.nix { };
  nodejs-18 = nodejs-18_x;

in {
  inherit nodejs-12 nodejs-18;
  nodejs = nodejs-18;
}
