{ config, pkgs, lib, ... }:

let 
  secrets = import ../secrets.nix;
in 
{
  home.username = "point";
  home.homeDirectory = "/home/point";

  home.stateVersion = "25.05";

  home.pointerCursor = {
    gtk.enable = true;

    package = pkgs.kdePackages.breeze;
    name = "breeze_cursors";
    size = 24;
  };

  gtk = {
    enable = true;
    gtk4.theme = config.gtk.theme;
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

    shellAliases = let
      dir = "/home/point/flake-nixos";
    in {
      rebuild = "sudo nixos-rebuild switch --flake ${dir}#nixos";
      rb = "sudo nixos-rebuild switch --flake ${dir}#nixos";
      home = "nvim ${dir}/nixos/home/home.nix";
      pack = "nvim ${dir}/nixos/modules/packages.nix";
      conf = "nvim ${dir}/nixos/hosts/pc/configuration.nix";
      desk = "nvim ${dir}/nixos/modules/desktop.nix";
      hard = "nvim ${dir}/nixos/hosts/pc/hardware.nix";
      rebuildboot = "sudo nixos-rebuild boot --flake ${dir}#nixos";
    };
  };


  programs.git = {
    enable = true;
    
    settings = {
      user = {
        name = "jstolk";
        email = "julesstolk+github@gmail.com";
      };
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
      core.askPass = "";
    };
  };

  # git ssh key
  services.ssh-agent.enable = true;
  
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."*".addKeysToAgent = "yes";
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

  # background
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/nixos/home/wallpaper.png"
      ];
      wallpaper = [ {
        monitor = "";
        path = "~/nixos/home/wallpaper.png";
        }
      ];
    };
  };  


  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";    

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
      monitor = [
	"DP-3, 2560x1440@240,0x0,1"
      ];

      "$mainMod" = "SUPER";

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bind = [
          "$mainMod, A, workspace, 1"
	  "$mainMod, S, workspace, 2"
	  "$mainMod, D, workspace, 3"
	  "$mainMod, F, workspace, 4"
	  "$mainMod, Z, workspace, 5"
	  "$mainMod, X, workspace, 6"
	  "$mainMod, C, workspace, 7"
	  "$mainMod, V, workspace, 8"
	  "$mainMod, 9, workspace, 9"
	  "$mainMod, 0, workspace, 10"
          "$mainMod SHIFT, A, movetoworkspace, 1"
	  "$mainMod SHIFT, S, movetoworkspace, 2"
	  "$mainMod SHIFT, D, movetoworkspace, 3"
	  "$mainMod SHIFT, F, movetoworkspace, 4"
	  "$mainMod SHIFT, Z, movetoworkspace, 5" 
	  "$mainMod SHIFT, X, movetoworkspace, 6"
	  "$mainMod SHIFT, C, movetoworkspace, 7"
	  "$mainMod SHIFT, V, movetoworkspace, 8"
	  "$mainMod SHIFT, 9, movetoworkspace, 9"
	  "$mainMod SHIFT, 0, movetoworkspace, 10"
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          "$mainMod, W, killactive"
          "$mainMod, Q, exec, kitty"
          "$mainMod, R, exec, wofi --show drun"
          ", Print, exec, grimblast copy area" 
      ];
    }; 
  };
}

