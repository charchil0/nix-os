{ config, lib, pkgs, ... }:
{
  imports = [
    # Include the result of hardware scan
    ./hardware-configuration.nix
    ./modules
  ];
}
