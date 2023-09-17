# Build a specific version of Terraform
# Create a shell-script wrapper around this version
# Append the version to the shell-script's filename

{ pkgs,
  callPackage,
  # terraform,
  terraform-providers,
  writeShellScriptBin,
}:

let
  # The path to the Terraform Building functions:
  terraform-path = "${pkgs.path}/pkgs/applications/networking/cluster/terraform";
  terraform-builder = callPackage terraform-path {};

  # These functions aren't exposed in Nixpkgs, so this is how we can access them:
  mkTerraform = terraform-builder.mkTerraform;
  terraform_plugins_test = terraform-builder.terraform_plugins_test;

  terraform-patches = {
    provider-path-0_15 = [ "${terraform-path}/provider-path-0_15.patch" ];
  };

  # "plugins" is a locally-scoped variable, so we have to copy-pasta the relevant code here:
  terraform-plugins = removeAttrs terraform-providers [
    "override"
    "overrideDerivation"
    "recurseForDerivations"
  ];

  terraformVersion = { version, hash, vendorHash ? null, patches ? [], }:
    mkTerraform {
      inherit version hash vendorHash patches;
      passthru = {
        plugins = terraform-plugins;
        tests = { inherit terraform_plugins_test; };
      };
    };

  terraformVersionWrapped = { version, ... }@args:
    writeShellScriptBin "terraform-${version}" ''
      exec ${terraformVersion args}/bin/terraform "$@"
    '';

in {
  inherit terraform-patches terraformVersion terraformVersionWrapped;
}
