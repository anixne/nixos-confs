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
    ./hardware-configuration.nix
  ];
 

  nix.settings.experimental-features = ["nix-command" "flakes"];


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = ["radeon.si_support=0" "amdgpu.si_support=1"];
  boot.initrd.kernelModules = ["amdgpu"];
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix-550a;


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

  networking.hostName = "kusanagi";

  networking.networkmanager.enable = true;

  
  time.timeZone = "Asia/Tashkent";

  
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.xkb = {
    layout = "us,ru";
    options ="caps:escape, grp:alt_shift_toggle";
    variant = "";
  };
  services.upower.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.printing.enable = true;


  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  programs.niri.enable = true;


  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gnome];
  };
 
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "maya";
  };

  users.users."anixne" = {
    isNormalUser = true;
    description = "anixne";
    extraGroups = ["networkmanager" "wheel" "video"];
    packages = with pkgs; [];
  };
  
  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs;
    [
      vim
      wget
    ]
    ++ (
      with nixpkgs-unstable; [
        ayugram-desktop
      ]
    );

  system.stateVersion = "26.05";
}
