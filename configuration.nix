{ config, lib, pkgs, ... }:
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/boot.nix
      ./modules/nix-config.nix
      ./modules/packages.nix
      ./modules/user.nix
      ./modules/hyprland.nix
      ./modules/services.nix
      ./modules/sound.nix
    ];


  # Networking
  networking = {
    hostName = "viole";
    networkmanager.enable = true;
    enableIPv6 = false;
    firewall.enable = true;
  };



  # Bluetooth
  hardware = {
    opengl.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings = {
        General = {
          #Enable = "Source,Sink,Media,Socket";
          #Experimental = true;
        };
      };
    };
  };


  # Localization
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    useXkbConfig = false;
  };

  # Time configuration
  time = {
    timeZone = "Asia/Kathmandu";
    # hardwareClockInLocaltime = true;  

  };

  # Users

  programs.zsh.enable = true;

  #nix = {
  #  settings = {
  #    auto-optimise-store = true;
  #    experimental-features = [
  #      "nix-command"
  #      "flakes"
  #    ];
  #    substituters = [ "https://hyprland.cachix.org" ];
  #    #trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  #  };
  #  gc = {
  #    automatic = true;
  #    dates = "weekly";
  #    options = "--delete-older-than 7d";
  #  };
  #  };

  # System state version
  system.stateVersion = "24.05";
}
