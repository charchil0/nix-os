
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
nodejs

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

#music
spotify
];

 fonts.packages = with pkgs; [
    cascadia-code
    jetbrains-mono
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
 	];

}
