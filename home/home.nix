{ config, pkgs, lib, ... }:

let 
  secrets = import ../secrets.nix;
in 
{
  home.username = "point";
  home.homeDirectory = "/home/point";

  home.stateVersion = "26.05";

  home.pointerCursor = {
    gtk.enable = true;

    package = pkgs.kdePackages.breeze;
    name = "breeze_cursors";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };
    cursorTheme = {
      name = "breeze_cursors";
      package = pkgs.kdePackages.breeze;
    };
  };

  programs.bash = {
    enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch -I nixos-config=/home/point/nixos/configuration.nix";
      rb = "sudo nixos-rebuild switch -I nixos-config=/home/point/nixos/configuration.nix";
      home = "nano /home/point/nixos/home/home.nix";
      pack = "nano /home/point/nixos/modules/packages.nix";
      conf = "nano /home/point/nixos/hosts/pc/configuration.nix";
      desk = "nano /home/point/nixos/modules/desktop.nix";
      hard = "nano /home/point/nixos/hosts/pc/hardware.nix";
      rebuildboot = "sudo nixos-rebuild boot -I nixos-config=/home/point/nixos/configuration.nix";
    };
  };


  programs.git = {
    enable = true;
    
    settings.user = {
      user = {
        name = secrets.gitUser;
        email = secrets.gitEmail;
      };
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
      core.askPass = "";
    };
  };

  home.file.".config/wofi/style.css".source = ./dotfiles/wofi/style.css;

  programs.kitty = {
    enable = true;

    settings = {
    foreground = "#9f999b";
    background = "#222021";

    selection_foreground = "#9f999b";
    selection_background = "#2f2d2e";

    cursor = "#996e00";
    cursor_text_color = "#222021";

    url_color = "#f0a8c1";

    active_border_color = "#565254";
    inactive_border_color = "#222021";
    bell_border_color = "#ad1f51";
    visual_bell_color = "none";

    wayland_titlebar_color = "#2f2d2e";
    macos_titlebar_color = "#2f2d2e";

    active_tab_foreground = "#fbfaf9";
    active_tab_background = "#222021";
    inactive_tab_foreground = "#aeaca7";
    inactive_tab_background = "#2f2d2e";
    tab_bar_background = "#2f2d2e";
    tab_bar_margin_color = "none";

    mark1_foreground = "#222021";
    mark1_background = "#875e6d";

    mark2_foreground = "#222021";
    mark2_background = "#8b8984";

    mark3_foreground = "#222021";
    mark3_background = "#aa7c09";

    color0 = "#222021";
    color8 = "#635f60";

    color1 = "#936c7a";
    color9 = "#ddaf3c";

    color2 = "#cca133";
    color10 = "#2f2d2e";

    color3 = "#ffcc4d";
    color11 = "#565254";

    color4 = "#9c818b";
    color12 = "#706b6d";

    color5 = "#cca133";
    color13 = "#f0a8c1";

    color6 = "#d27998";
    color14 = "#c39622";

    color7 = "#9f999b";
    color15 = "#ffebf2";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      animations {
        enabled = false
      }

      general {
        gaps_in = 0
        gaps_out = 0
        border_size = 0

        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)

        resize_on_border = false
        allow_tearing = false

        layout = "dwindle"
      }
    '';

    settings = {
      exec-once = ["${pkgs.awww}/bin/swww-daemon & sleep 0.2 & ${lib.getExe pkgs.awww} img ${./wallpaper.png}"];

      "$mainMod" = "SUPER";

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bind = [
          "$mainMod, 1, workspace, 1"
	  "$mainMod, 2, workspace, 2"
	  "$mainMod, 3, workspace, 3"
	  "$mainMod, 4, workspace, 4"
	  "$mainMod, 5, workspace, 5"
	  "$mainMod, 6, workspace, 6"
	  "$mainMod, 7, workspace, 7"
	  "$mainMod, 8, workspace, 8"
	  "$mainMod, 9, workspace, 9"
	  "$mainMod, 0, workspace, 10"
          "$mainMod SHIFT, 1, movetoworkspace, 1"
	  "$mainMod SHIFT, 2, movetoworkspace, 2"
	  "$mainMod SHIFT, 3, movetoworkspace, 3"
	  "$mainMod SHIFT, 4, movetoworkspace, 4"
	  "$mainMod SHIFT, 5, movetoworkspace, 5"
	  "$mainMod SHIFT, 6, movetoworkspace, 6"
	  "$mainMod SHIFT, 7, movetoworkspace, 7"
	  "$mainMod SHIFT, 8, movetoworkspace, 8"
	  "$mainMod SHIFT, 9, movetoworkspace, 9"
	  "$mainMod SHIFT, 0, movetoworkspace, 10"
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          "$mainMod, C, killactive"
          "$mainMod, Q, exec, kitty"
          "$mainMod, R, exec, wofi --show drun"
          ", Print, exec, grimblast copy area" 
      ];
    }; 
  };
}

