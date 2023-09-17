{ callPackage, ... }:

{
  cli = callPackage ./cli { };
  cdk = callPackage ./cdk { };
}
