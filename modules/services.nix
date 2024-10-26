
{ config, lib, pkgs, ... }:
{
  
  #flatpak.enable = false;

  # Services
  services = { 
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };


    xserver = { 
      enable = true;
displayManager.lightdm.enable = false;
       };

    libinput.enable = true;

 fstrim = {
      enable = true;
      interval = "weekly";
      };
displayManager.sddm.enable = false;
  };
}
