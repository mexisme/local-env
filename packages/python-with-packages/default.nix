{ python3 }:

let
  python-packages = packages: with packages; [
    boto3
    requests
  ];
in
python3.withPackages python-packages
