# "nix-ld" is an .so-resolver for Nix's non-FHS file hierarchy, that will allow binaries depending on the FHS to run with .so binaries stored in the Nix store:
#
# But, it installs to libexec/ which isn't on the $PATH, and will also not be auto-exposed by devenv.sh.
# So this providex a simple wrapper so it can be found under bin/ and to make sure devenv.sh makes it available   ;-)

{ writeShellApplication,
  nix-ld,
}:

writeShellApplication {
  name = "with-nix-ld";
  runtimeInputs = [ nix-ld ];
  text = ''
      exec ${nix-ld}/libexec/nix-ld "''$@"
    '';
}
