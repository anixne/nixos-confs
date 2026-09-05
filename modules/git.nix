{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "anixne";
        email = "mobilecoderdev@gmail.com";
      };
      init = {
        defaultBranch = "main";
      };
      core = {
        editor = "nvim";
      }
    };

    extraConfig = {
      pull.rebase = false;
    };
  };
}
