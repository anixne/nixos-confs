{ config, pkgs, ... }:

{
  imports = [
    ./modules/astronvim.nix
  ];

  home.username = "anixne";
  home.homeDirectory = "/home/anixne";


  home.packages = with pkgs; [
    fastfetch
    

    #editors
    vscode

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
    gh
    wl-clipboard
    impala
    pavucontrol
    blueman
    swww
    swaynotificationcenter
    foot
    regreet
    brightnessctl
    noctalia-shell
    fuzzel
    tree-sitter
    wttrbar
    networkmanagerapplet

    #programming
    rustup
    gcc
    gdb
    ghc
    python3
    cabal-install
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
 
  programs.git = {
    enable = true;
    userName = "anixne";
    userEmail = "mobilecoderdev@gmail.com";
  };

  home.stateVersion = "26.05";
}
