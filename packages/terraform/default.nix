{ callPackage,
  terraform,
}:

let
  terraform-versions = callPackage ./versions { };

# "terraform" is below, merely for completeness:
in { inherit terraform terraform-versions; }
