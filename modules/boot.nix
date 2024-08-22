# { config, pkgs, ... }:
#
# {
#   # Basic system settings
#   systemd.services = {
#     # Example: Custom systemd service configuration (if needed)
#     myService = {
#       description = "My custom service";
#       after = [ "network.target" ];
#       serviceConfig = {
#         ExecStart = "${pkgs.hello}/bin/hello";
#         Restart = "always";
#       };
#       wantedBy = [ "multi-user.target" ];
#     };
#   };

{ config, pkgs, ... }:

{


  #custom grub config

  boot.loader.grub =
    {
      enable = true;
      device = "/dev/sda";
      efiSupport = true;
      useOsProber = true; #other os detect
      timeout = 5;
      default = "saved"; #default boot entry to last boot entry
      timeoutStyle = "menu";
      terminalInput = [ "console" ];
      terminalOutput = [ "console" ];
      gfxMode = "1920x1080";
      disableRecovery = true; #disable recovery mode entries for GRUB
      saveDefault = true;

    };

  boot.initrd.luks.devices."luksroot".device = "/dev/disk/by-uuid/YOUR-UUID-HERE"; #luks encryption setup
  hardware.cpu.intel.updateMicrocode = true; #intel microcode


  # Custom kernel parameters
  # boot.kernelParams = [ "loglevel=3" "quiet" "splash" ]; # Equivalent to GRUB_CMDLINE_LINUX_DEFAULT

  # Preload GPT and MBR modules
  # boot.loader.grub.preloadModules = [ "part_gpt" "part_msdos" ]; # Equivalent to GRUB_PRELOAD_MODULES
}
