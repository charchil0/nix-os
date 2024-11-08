{ config, lib, pkgs, ... }:
{

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  security.polkit.enable = true;


  #system packages
  environment.systemPackages = with pkgs; [

    #git packages
    gh
    git

    #Terminals
    kitty
    alacritty

    #shells
    zsh

    #hyprland packages
    hyprlock
    hyprpicker
    dunst
    rofi-wayland
    waybar
    swww
    swappy
    cliphist
    #qt5ct
    #qt6ct
    nwg-look
    slurp
    imagemagick
    libnotify


    #Terminal commands and packages
    parallel
    jq
    eza
    lsd
    starship
    brightnessctl
    zoxide
    fzf
    fd
    tmux
    btop
    fastfetch

    #Editors
    vim
    neovim
    vscode

    #File Manager
    xfce.thunar
  ];

}

