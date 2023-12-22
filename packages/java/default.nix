{ openjdk8,
  openjdk11,
  openjdk17,
  openjdk19,
  writeShellApplication,
}:

let
  jdk-8 = openjdk8;
  jdk-11 = openjdk11;
  jdk-17 = openjdk17;  # Current LTS
  jdk-19 = openjdk19;

  java-wrapper =
    {
      name,
      package ? jdk-19,
      runtimeInputs ? [],
    }: writeShellApplication {
      name = "with-${name}";
      runtimeInputs = [ package ] ++ runtimeInputs;
      text = ''
        main() {
          : "''${1:?"#ERR: Binary to wrap not provided?"}"

          export JAVA_HOME="${package}/lib/openjdk"
          exec "''$@"
        }

        main "''$@"
    '';
    };

in {
  inherit jdk-8 jdk-11 jdk-17 jdk-19;
  with-jdk-19 = java-wrapper { name = "jdk-19"; package = jdk-19; };
  jdk = jdk-19;
}
