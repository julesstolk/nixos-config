{ config, pkgs, lib, ... }:

{
  # nvidia
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaSettings = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # game performance enhance idk
  powerManagement.cpuFreqGovernor = "performance";

  programs.gamemode.enable = true;

  # mount nvme ssd
  fileSystems."/mnt/nvme" = {
    device = "/dev/disk/by-uuid/f402ebf4-5bde-4b3b-9ee8-47f8984c573b";
    fsType = "ext4";
  };

}
