{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git 
    curl
    kitty
    wofi
    zip
    unzip
    awww   # wallpaper
    pavucontrol # audio gui
    parted
    systemd
    pulseaudio
    btop
    home-manager
    lact
    
    grimblast # screenshot
    mpv
    vlc

    bottles
    lutris
    discord
    vesktop
    prismlauncher

    vulkan-tools

    qbittorrent
    kdePackages.qtsvg
    kdePackages.dolphin
    spotify
    helix
    gimp

    vscode
    uv
    ffmpeg
    gpu-screen-recorder-gtk
    android-studio
    neovim
    
    bibata-cursors
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.breeze-gtk

  ];

  programs.seahorse.enable = true;
  programs.firefox.enable = true;
  programs.gpu-screen-recorder.enable = true;
}


