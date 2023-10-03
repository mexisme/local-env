# Why We Should Care

Modern development requires agility, repeatability, and a consistent environment to ensure our code works seamlessly across various platforms. The introduction of `local-env` via Nix and devenv.sh is our solution.

## Hermetic and Repeatable Builds

`local-env` combines the power of Nix and [devenv.sh](https://devenv.sh) to guarantee a fully hermetic and repeatable build environment. This harmony ensures our code runs uniformly on:

- Linux
- MacOS
- Windows (via WSL2)
- Almost all CI/CD systems

## Core Features

- **Built-in caching:** Speed up your builds.

- **Distributed build farms:** Scale as needed.

- **Cross-compilation:** Build for multiple targets.

- **Graph management:** Handle large-scale dependencies with ease.

- **Multi-version binaries:** Install different versions side-by-side.

## User Experience

We acknowledge the initial learning curve. Nix's language is an intricate blend of declarative and pure-functional, and it incorporates uplift from external resources for secure side effects. But fret not:

- **devenv.sh Wrapper:** It simplifies the experience, offers easy configurations, and enhances native features. 

- **Containers & VSCode:** Seamlessly convert to containers, including VSCode's dev-containers.

- **Background processes:** Manage services like a mini PostgreSQL for local testing.

- **Integration with [direnv](https://direnv.net/):** Auto-instantiate your local dev environment, compatible with major IDEs - IntelliJ, VSCode, Emacs, Vim, and more.

## Getting started

### Install Nix.

The main URL for Nix is [NixOS](https://nixos.org).

_*Warning:*_ The doc's are dense, and (currently) quite complex.  The community knows this, and is slowly working on improving them.

To install to most Unices, incl. Linux, MacOS and WSL2:
- https://nixos.org/download.html

To install a NixOS Distro into WSL2 on Windows:
- https://github.com/nix-community/NixOS-WSL#readme

### Enable Nix Flakes

Edit the `~/.config/nix/nix.conf` (for user-local config) or `/etc/nix/nix.conf` (for system-wide config) and add the following lines:

```
experimental-features = nix-command flakes
```

- [Source](https://nixos.wiki/wiki/Flakes#Permanent)

_*NOTE:*_ If you've installed Nix in "multi-user mode" or have installed the NixOS Distro, then it's recommended you update the `/etc/nix/nix.conf` file.
