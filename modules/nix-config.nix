#{ config, pkgs, user, ... }:
{

  imports = [
    ./hardware-configuration.nix
  ];

  documentation.nixos.enable = false;

  nix = {
    settings = {
      warn-dirty = false;
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      #substituters = ["https://nix-gaming.cachix.org"];
      #trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      #allowUnfreePredicate = pkg: builtins.elem (builtins.parseDrvName pkg.name).name ["steam"];

      #permittedInsecurePackages = [
      #    "openssl-1.1.1v"
      #    "python-2.7.18.7"
      #];
    };
  };




}

