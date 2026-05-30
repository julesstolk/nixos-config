{ config, pkgs, lib, ... }:

{
  # amd gpu drivers
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        libva
      ];
    };

    amdgpu = {
      opencl.enable = true;
    };
  };

  # game performance enhance idk
  powerManagement.cpuFreqGovernor = "performance";

  programs.gamemode.enable = true;
}
