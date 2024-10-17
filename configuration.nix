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
    
    loader = {
      efi = { 
        canTouchEfiVariables = true; 
        efiSysMountPoint = "/boot/efi";
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
    firewall.enable = true;  
  };

  # Install fonts
  environment.systemPackages = with pkgs; [
    firefox
    kitty
  ];

 environment.shells = with pkgs; [ zsh ];

  # Hyprland
  programs.hyprland = { 
    enable = true; 
    xwayland.enable = true;
  };

 # Bluetooth
  hardware = {
    graphics.enable = true;
    opengl.enable = true;
    pulseaudio.enable = true;
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

  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
  };


  # Sound configuration
  sound = {
    enable = false;  # Change to true if you plan to use sound
  };

  # Localization
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    useXkbConfig = true; 
  };

  # Time configuration
  time = {
    timeZone = "Asia/Kathmandu";
   # hardwareClockInLocaltime = true;  
    timeSync.enable = true;

  };

  # Users
  users = {
    users.viola = {
      isNormalUser = true;
      home = "/home/viola";
      description = "its viola, i suppose;";
      extraGroups = ["wheel" "networkmanager"];
      hashedPassword = "$6$vHKMmwAI5IGJzonT$IeTyEq21hR60k7Pkm8.keOv1cKUXFFtbqdTkp/OMs8fv622dqqadHP7kieEDe0V4UJX5WgstGcr1DpaHxYkg..";
    };
    defaultUserShell = pkgs.zsh;
  };


  # Services
  services = { 
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };

    xserver = { 
      enable = true;
    };

    libinput.enable = true;

 fstrim = {
      enable = true;
      interval = "weekly";
      };
  };

 fonts.packages = with pkgs; [
    cascadia-code
    fira-code
    noto-fonts-cjk
    jetbrains-mono
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
 	];

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
