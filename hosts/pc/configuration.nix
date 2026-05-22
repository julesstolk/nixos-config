# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
 
    ../../modules/packages.nix
    ../../modules/desktop.nix

    <home-manager/nixos>
  ];  

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.point = import ../../home/home.nix;



  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # fix uv
  programs.nix-ld.enable = true;


  users.users.point = {
    isNormalUser = true;
    extraGroups = [ "wheel" "bluetooth" "networkmanager" "audio" "video" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };


  # steam shit
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    protontricks.enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    package = pkgs.steam.override {
      extraPkgs = 
        pkgs: with pkgs; [
          gamemode
	  mangohud
        ];
    }; 
  };

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "nodev"; # or "nodev" for efi only

  # networking.hostName = "nixos"; # Define your hostname.

  system.stateVersion = "25.05"; # Did you read the comment?

}

