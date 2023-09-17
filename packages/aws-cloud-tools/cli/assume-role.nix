{ pkgs,
  lib,
  awscli2,
  jq,
  writeShellApplication,
  writeShellScriptBin,
}:

let
  assume-role-credentials = writeShellApplication {
    name = "assume-role-credentials";
    runtimeInputs = [
      awscli2
      jq
    ];
    text = ''
  ROLE_ARN="$1"
  ROLE_SESSION_NAME="''${2:-AWSCLI-Session}"

  aws sts assume-role --role-arn "$ROLE_ARN" --role-session-name "$ROLE_SESSION_NAME"| \
    jq -r '"AWS_ACCESS_KEY_ID=\"\(.Credentials.AccessKeyId)\"\nAWS_SECRET_ACCESS_KEY=\"\(.Credentials.SecretAccessKey)\"\nAWS_SESSION_TOKEN=\"\(.Credentials.SessionToken)\""'
  '';
  };

  assume-role-sourced = writeShellScriptBin "assume-role-sourced"
    ''
      assume_role_export() {
        ${assume-role-credentials}/bin/assume-role-credentials "$@" | while read CRED; do
          echo "export $CRED"
        done
      }

      assume_role_eval() {
        eval $(assume_role_export "$@")
      }
    '';

in {
  inherit assume-role-credentials assume-role-sourced;
}
