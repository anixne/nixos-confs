# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  nixpkgs-unstable = import inputs.nixpkgs-unstable {inherit system;};
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];
 

  # Enabling the Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = ["radeon.si_support=0" "amdgpu.si_support=1"];
  boot.initrd.kernelModules = ["amdgpu"];
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix-550a;

  #tlp for thinkpad

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALLING_GOVERNOR_ON_AC = "performance";
      CPU_SCALLING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 80;

      RUNTIME_PM_ON_BAT = "auto";
      WIFI_PWR_ON_BAT = "on";
    };
  };

  services.power-profiles-daemon.enable = false;

  networking.hostName = "kusanagi"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tashkent";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11/Console
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.upower.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # --------------------------------------------------------------------
  # NIRI COMPOSITOR & WAYLAND SETUP
  # --------------------------------------------------------------------
  programs.niri.enable = true;

  # XDG Desktop Portal for Wayland screen sharing and file pickers
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gnome];
  };
  # --------------------------------------------------------------------
  # SDDM
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "maya";
  };

  # --------------------------------------------------------------------
  # USER CONFIGURATION
  # --------------------------------------------------------------------
  users.users."anixne" = {
    isNormalUser = true;
    description = "anixne";
    extraGroups = ["networkmanager" "wheel" "video"];
    packages = with pkgs; [];
  };

  # Default programs
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # --------------------------------------------------------------------
  # SYSTEM PACKAGES & RICE TOOLKIT
  # --------------------------------------------------------------------
  environment.systemPackages = with pkgs;
    [
      vim
      wget
      git
      cargo
      gcc
      rustc
      spotify
      vscode
      btop
      fastfetch
      helix
      libreoffice
      gh
      cabal-install
      ghc
      chromium
      remmina
      mtr
      thunar
      python3
      zlib
      unzip
      easyeffects
      qbittorrent
      telegram-desktop
      vlc
      osu-lazer-bin
      qimgv
      fuzzel # App launcher
      swww # Wallpaper daemon
      swaynotificationcenter # Notification center & control panel
      foot
      regreet
      alacritty
      wezterm
      nemo
      noctalia-shell
      brightnessctl
      wttrbar
      blueman
      pavucontrol
      networkmanagerapplet
      impala
      neovim # Fast Wayland terminal
      grim # Screen capture
      slurp # Region selection for screenshots
      wl-clipboard # System clipboard integration
      libnotify # Desktop notification triggers
      guvcview
      obsidian
      deno
    ]
    ++ (
      with nixpkgs-unstable; [
        ayugram-desktop
      ]
    );

  # --------------------------------------------------------------------
  # STATE VERSION
  # --------------------------------------------------------------------
  system.stateVersion = "26.05";
}
