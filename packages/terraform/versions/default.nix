# Install multiple versions of Terraform with versioned wrapper scripts

{ pkgs,
  lib,
  stdenv,
  buildEnv,
  callPackage,
}:

let
  inherit (callPackage ./wrapped.nix { }) terraform-patches terraformVersionWrapped;

  terraform_0_12_31 = terraformVersionWrapped {
    version = "0.12.31";
    hash = "sha256-z50WYdLz/bOhcMT7hkgaz35y2nVho50ckK/M1TpK5g4=";
  };

  terraform_0_13_7 = terraformVersionWrapped {
    version = "0.13.7";
    hash = "sha256-5vETtf9Ypu3M848F8SHmNzUwSiOnWxnB5gGCIwQiV0k=";
  };

  terraform_0_14_11 = terraformVersionWrapped {
    version = "0.14.11";
    hash = "sha256-Mh1xq4hz9Ixf5BifRWk6eIgGNTrUcDqRneEFY4eUIfo=";
    vendorHash = "sha256-tWrSr6JCS9s+I0T1o3jgZ395u8IBmh73XGrnJidWI7U=";
  };

  terraform_0_15_5 = terraformVersionWrapped {
    version = "0.15.5";
    hash = "sha256-zXQv9svJXx341PFzgrApEaQ2Y38KkPlO9WxoIqhRxKE=";
    vendorHash = "sha256-oFvoEsDunJR4IULdGwS6nHBKWEgUehgT+nNM41W/GYo=";
    patches = terraform-patches.provider-path-0_15;
  };

  terraform_1_0_11 = terraformVersionWrapped {
    version = "1.0.11";
    hash = "sha256-Z2qFetJZgylRbf75oKEr8blPhQcABxcE1nObUD/RBUw=";
    vendorHash = "sha256-4oSL7QT6KjZlt3NKkjNWcrZA8yCkx6aI2kYsdyh8L68=";
    patches = terraform-patches.provider-path-0_15;
  };

  terraform_1_1_9 = terraformVersionWrapped {
    version = "1.1.9";
    hash = "sha256-6dyP3Y5cK+/qLoC2QPZW3QNgqOeVXegC06Pa7pSv1iE=";
    vendorHash = "sha256-YI/KeoOIxgCAS3Q6SXaW8my0PyFD+pyksshQEAknsz4=";
    patches = terraform-patches.provider-path-0_15;
  };

  terraform_1_2_9 = terraformVersionWrapped {
    version = "1.2.9";
    hash = "sha256-Q5AJiFnbHXhIJP06SCJNvuMKGwEJUOsmueCI7QCeQlk=";
    vendorHash = "sha256-VKJ+aWZYD6N8HDJwUEtgWxoBMGOa27K9ze2RUJvuipc=";
    patches = terraform-patches.provider-path-0_15;
  };

  terraform_1_3_5 = terraformVersionWrapped {
    version = "1.3.5";
    hash = "sha256-+jmZcIF9+vvjoA/PXWCc3F4l3YnlpZgxs0eGxchiIBE=";
    vendorHash = "sha256-fviukVGBkbxFs2fJpEp/tFMymXex7NRQdcGIIA9W88k=";
    patches = terraform-patches.provider-path-0_15;
  };

in buildEnv {
  # pathsToLink ignoreCollisions postBuild;
  extraOutputsToInstall = [ "man" ];

  name = "terraform-versions";
  paths = with pkgs; [
    # Creates a "terraform-0.12.31" wrapper script:
    terraform_0_12_31
    # Creates a "terraform-0.13.7" wrapper script:
    terraform_0_13_7
    # Creates a "terraform-0.14.11" wrapper script:
    terraform_0_14_11
    # Creates a "terraform-0.15.5" wrapper script:
    terraform_0_15_5

    # TODO(willjr): Figure out why Go is failing more-recent builds:
    # # Creates a "terraform-1.0.11" wrapper script:
    # terraform_1_0_11
    # # Creates a "terraform-1.1.9" wrapper script:
    # terraform_1_1_9
    # # Creates a "terraform-1.2.9" wrapper script:
    # terraform_1_2_9
    # # Creates a "terraform-1.3.5" wrapper script:
    # terraform_1_3_5
  ];
}
