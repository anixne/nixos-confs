{pkgs, ...}: {
  programs.zed-editor = {
    enable = true;
    
    userSettings = import ./settings.nix { };
    
    extensions = import ./extensions.nix { };

    extraPackages = with pkgs; [
    wakatime-cli
  ];
  };
}
