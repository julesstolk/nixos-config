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
    swww   # wallpaper
    pavucontrol # audio gui
    parted
    systemd
    pulseaudio

    grimblast # screenshot
    mpv

    wineWowPackages.stable
    bottles
    lutris
    discord
    prismlauncher

    vulkan-tools

    qbittorrent
    kdePackages.qtsvg
    kdePackages.dolphin
    spotify
    helix
    neofetch
    gimp

    vscode
    android-studio
    uv
    ffmpeg    
  ];

  programs.firefox.enable = true;
}

