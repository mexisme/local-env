{ pkgs,
  lib,
  callPackage,
  openssl_1_1,
  python2,
  ...
}:

let
  # The Nodejs build scripts aren't exposed directly from "nixpkgs" so we have to
  # import the function directly from the original nixpkgs source:
  nodejs-dir = pkgs.path + "/pkgs/development/web/nodejs";
  buildNodejs = callPackage "${nodejs-dir}/nodejs.nix" {
    # It looks like Node-12 is only compatible with OpenSSL 1.1.1
    # - https://github.com/nodejs/node/blob/v12.x/BUILDING.md#openssl-asm-support
    openssl = openssl_1_1;
    # Nodejs-12 relies on "distutils" which is expected to be removed in Py3.12
    # Therefore, we'll use Py2, since Nodejs-12 is too bloody old, realistically!
    python = python2;
  };
in
buildNodejs {
  enableNpm = true;
  version = "12.22.12";
  sha256 = "sha256-vEK3+Elbm/x/eFDdGAuwKlvfE5zCMrjG8CppZ+IHFPI=";
  # patches = lib.optional stdenv.isDarwin ./bypass-xcodebuild.diff;
}
