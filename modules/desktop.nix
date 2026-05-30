{ config, pkgs, ... }:

{
  # window manager

  # enable x11 windowing system
  services.xserver.enable = true;

  # hyprland
  programs.hyprland.enable = true;
  services.displayManager.gdm.enable = true;

  # configure keymap x11
  services.xserver.xkb.layout = "us";


  # audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;
    jack.enable = true;
  };

  services.pulseaudio.enable = false;

  # bluetooth
  security.rtkit.enable = true;  

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

  services.blueman.enable = true;

  # other, time, internationalisation, i18n
  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    useXkbConfig = true; # use xkb.options in tty.
  };

  networking.networkmanager.enable = true;

  system.copySystemConfiguration = true;  

}
