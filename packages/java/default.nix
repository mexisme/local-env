{ openjdk8,
  openjdk11,
  openjdk17,
  openjdk19,
}:

let
  jdk-8 = openjdk8;
  jdk-11 = openjdk11;
  jdk-17 = openjdk17;  # Current LTS
  jdk-19 = openjdk19;

in {
  inherit jdk-8 jdk-11 jdk-17 jdk-19;
  jdk = jdk-19;
}
