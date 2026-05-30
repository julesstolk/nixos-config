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
    android-studio
    uv
    ffmpeg    
    
    bibata-cursors
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.breeze-gtk

  ];

  programs.firefox.enable = true;
}

