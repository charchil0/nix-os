{ config, lib, pkgs, ... }:

{


  environment.systemPackages = with pkgs; [
    libvirt
    qemu_kvm
  ];


virtualisation.libvirtd = {
  enable = true;
  qemu = {
    package = pkgs.qemu_kvm;
    runAsRoot = true;
    swtpm.enable = true; #software-based tpm emulation for vms
    ovmf = {             #Open Virtual Machine Firmware : open source implementation of uefi 
      enable = true;
      packages = [(pkgs.OVMF.override {
        secureBoot = true;
        tpmSupport = true;
      }).fd]; # firmware disk image file extension used by qemu to boot vms in uefi
    };
  };
};


}
