{ config, lib, pkgs, ... }:
{

  users = {
    users.viola = {
      isNormalUser = true;
      home = "/home/viola";
      description = "its viola, i suppose;";
      extraGroups = ["wheel"
       "networkmanager" 
      "qemu" 
      "libvirtd" 
       "sshd" 
       "audio" 
       "video" 
       "root" 
       #"flatpak"
       ];
      hashedPassword = "$6$vHKMmwAI5IGJzonT$IeTyEq21hR60k7Pkm8.keOv1cKUXFFtbqdTkp/OMs8fv622dqqadHP7kieEDe0V4UJX5WgstGcr1DpaHxYkg..";
      shell = pkgs.zsh;
    };
  };
}
