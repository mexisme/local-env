{ pkgs,
  buildEnv,
  callPackage,
}:

let
  packages = {
    pr-train = callPackage ./pr-train {};

    inherit (pkgs)
      gitFull

      # https://symflower.com/en/company/blog/2021/git-autofixup/
      git-autofixup

      # Tooling to help with clean rebasing and experimenting in a branchless way:
      # - https://github.com/arxanas/git-branchless
      # Designed for trunk-based development
      git-branchless

      # Github's Large File extension(s)
      git-lfs

      # Text-based UIs for Git:
      gitui
      lazygit;

    inherit (pkgs.gitAndTools)
      git-extras

      # A better diff'er:
      # Enable with the following in your Git config:
      #
      # [core]
      #	pager = delta
      #	log = delta
      #	reflog = delta
      #	show = delta
      delta

      # A multi-repo ingestor:
      git-subrepo

      # To support https://docs.github.com/en/get-started/quickstart/github-flow :
      gitflow

      # Github CLI tool:
      git-hub;
  };

  all = buildEnv {
    name = "all-git-tools";
    paths = builtins.attrValues packages;
  };
in  { all = all; } // packages
