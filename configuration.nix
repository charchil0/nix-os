# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot = {
    kernelParams = [ "nohibernate" ];
    tmp.cleanOnBoot = true;
    #supportedFilesystems = [ "ntfs" ];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        device = "/dev/sda";
        efiSupport = true;
        enable = true;
        useOSProber = true;
        timeoutStyle = "menu";
      };
      timeout = 10;
    };


    networking = {
      hostName = "viole";
      networkmanager.enable = true;
      enableIPv6 = false;
      firewall.enable = false;
    };

    time.timeZone = "Asia/Kathmandu";
    users.users.viola = {
      isNormalUser = true;
      description = "Its me, i suppose;";
      extraGroups = [ "wheel" "networkmanager" ];
      hashedPassword = " ";
    };

    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };

    system.stateVersion = "24.05";

  };
}
