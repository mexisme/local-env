{ buildEnv,
  callPackage,
}:

let
  packages = {
    with-nix-ld = callPackage ./with-nix-ld { };
  };

  dev-tools-all = buildEnv {
    name = "dev-tools-all";
    paths = builtins.attrValues packages;
  };

in {
  inherit dev-tools-all;
} // packages
