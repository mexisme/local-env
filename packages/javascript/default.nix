{ callPackage,
  swc,
}:

let
  nodejs = callPackage ./node { };

in {
  # Very fast TS compiler, favoured by NestJS:
  # https://swc.rs/
  inherit swc;
} // nodejs
