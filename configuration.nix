
{ config, lib, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot = {
    kernelParams = [ "nohibernate" "noquiet" "debug" "root=/dev/sda3" ];
    tmp.cleanOnBoot = true;
    #supportedFilesystems = [ "ntfs" ];
    loader = {
      efi = { 
        canTouchEfiVariables = true; 
        efiSysMountPoint = true;
        };
      grub = {
        device = "/dev/sda";
        efiSupport = true;
        enable = true;
        useOSProber = true;
        timeoutStyle = "menu";
      };
      timeout = 10;
    };
  };


# Networking
    networking = {
      hostName = "viole";
      networkmanager.enable = true;
      enableIPv6 = false;
      firewall.enable = false;
    };



# Fonts
	#fonts.packages = with pkgs; [
	#  cascadia-code
	#];

# Install font
  environment.systemPackages = with pkgs; [ 
  fonts.cascadia-code
];


# Hyprland
programs.hyprland = { 
  enable = true; 
  xwayland.enable = true;
};

hardware = {
  opengl.enable = true;
};

xdg.portal.enable = true;
xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];

sound = {
  enable = false;
};




  # Localization
i18n.defaultLocale = "en_US.UTF-8";
 console = {
   font = "Lat2-Terminus16";
   keyMap = "us";
   useXkbConfig = false; 
 };

	# Time
	    time = {
	    timeZone = "Asia/Kathmandu";
	    hardwareClockInLocaltime = True;
	    }

# Users
    users.users = { 
      viola = {
      isNormalUser = true;
      home = "/home/viola";
      description = "its viola, i suppose;";
      shell = pkgs.zsh;
      extraGroups = ["wheel" "networkmanager"];
      hashedPassword = "";
      };
    };

  services = { 

  openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
      };

      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit= true;
        pulse.enable = true;
        jack.enable = true;
        wireplumber.enable = true;
      };

 xserver = { 
  libinput.enable = true;
 };

    };

    
  };
    
 
   environment.systemPackages = with pkgs; [
    firefox
    kitty
  ];


    system.stateVersion = "24.05";

}
