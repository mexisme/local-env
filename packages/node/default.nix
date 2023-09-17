{ callPackage,
  nodejs-18_x,
}:

{
  v12 = callPackage ./v12.nix { };
  v18 = nodejs-18_x;
}
