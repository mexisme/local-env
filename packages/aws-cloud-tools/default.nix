{ callPackage,
  buildEnv,
}:

let
  packages = {
    aws-cli = callPackage ./cli { };
    aws-cdk = callPackage ./cdk { };
  };

  aws-all = buildEnv {
    name = "aws-all";
    paths = builtins.attrValues packages;
  };

in { inherit aws-all; } // packages
