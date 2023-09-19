{ callPackage,
  terraform,
}:

{
  latest = terraform;
  versions = callPackage ./versions { };
}
