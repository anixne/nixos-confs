{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    ripgrep
    fd
    fzf
    nodejs_24
    tree-sitter
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  xdg.configFile."nvim".source = ../astronvim;
}
