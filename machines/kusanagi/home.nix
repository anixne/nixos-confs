{ config, pkgs, ... }:

{
  imports = [
    ../../modules/astronvim.nix
    ../../modules/git.nix
    ../../modules/zsh.nix
    ../../modules/zoxide.nix
    ../../modules/starship.nix
    ../../modules/haskell.nix
    ../../modules/vscode.nix
  ];

  home.username = "anixne";
  home.homeDirectory = "/home/anixne";


  home.packages = with pkgs; [
    fastfetch
    
    #terminals
    alacritty

    # archives
    zip
    xz
    unzip

    # networking tools
    mtr 
    iperf3
    dnsutils
  
    btop


    # system
    sysstat
    pciutils
    usbutils
    libnotify
    slurp
    grim
    wl-clipboard
    impala
    pavucontrol
    blueman
    awww
    swaynotificationcenter
    foot
    regreet
    brightnessctl
    noctalia-shell
    fuzzel
    tree-sitter
    wttrbar
    networkmanagerapplet
    kdePackages.dolphin
    kdePackages.kio-extras
    mtpfs

    #programming
    rustup
    gcc
    gdb
    python3
    nixd

    #other apps
    telegram-desktop
    qbittorrent
    vlc
    osu-lazer-bin
    chromium
    libreoffice
    spotify
    
  ];
 
  home.stateVersion = "26.05";
}
