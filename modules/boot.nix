{ config, lib, pkgs, ... }:
{
  boot = {
    kernelParams = [ "nohibernate" "noquiet" "debug" "root=/dev/sda3" ];
    tmp.cleanOnBoot = true;

    loader = {
      efi = {
        canTouchEfiVariables = true;
        #efiSysMountPoint = "/boot";
      };
      grub = {
        device = "nodev";
        efiSupport = true;
        enable = true;
        useOSProber = true;
        timeoutStyle = "menu";
      };
      timeout = 20;
    };
  };
}

