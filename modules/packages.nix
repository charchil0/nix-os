
{ config, lib, pkgs, ... }:
{

  # Install fonts
  environment.systemPackages = with pkgs; [

#Browsers
firefox
chromium
qutebrowser
brave
librewolf

#System Tools
unzip
zip
stow

#Developement Tools
nodejs_22

#Rust
rustup
cargo

#Password Manager
keepassxc

#Sound 
pamixer
pavucontrol

#video
stremio
];

 fonts.packages = with pkgs; [
    cascadia-code
    fira-code
    noto-fonts-cjk
    jetbrains-mono
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
 	];

}
