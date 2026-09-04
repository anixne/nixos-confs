{ config, pkgs, ... }:

{
  home.username = "anixne";
  home.homeDirectory = "/home/anixne";


  home.packages = with pkgs; [
    fastfetch
    

    #editors
    vscode

    # archives
    zip
    xz
    unzip

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
  
    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # syst:em tools
    sysstat
    ethtool
    pciutils # lspci
    usbutils # lsusb
    libnotify
    slurp
    grim
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

    #programming
    rustup
    gcc
    gdb
    ghc
    python3

    #other apps
    telegram-desktop
    qbittorrent
    vlc
    osu-lazer-bin
    chromium
    libreoffice
    spotify
    
  ];
  # basic configuration of neovim
  programs.neovim = {
  enable = true;
  plugins = with pkgs.vimPlugins; [
    (nvim-treesitter.withPlugins (plugins: with plugins; [
      vimdoc
      lua
      query
      c
      haskell
    ]))
  ];
};
  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "anixne";
    userEmail = "mobilecoderdev@gmail.com";
  };

  home.stateVersion = "26.05";
}
