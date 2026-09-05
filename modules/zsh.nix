{config, pkgs, ...}:

{
  home.packages = with pkgs; [
    yt-dlp
    ffmpeg
    eza
    bat
    zoxide
    starship
  ];

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
    size = 10000;
    save = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];

      theme = "robbyrussell";
    };
  shellAliases = {
    ydl = "yt-dlp -o '%(title)s.%(ext)s' -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'";
    adl = "yt-dlp -o '%(title)s.%(ext)s' -f 'bestaudio[ext=m4a]/best' --extract-audio";

    ls = "eza --icons";
    ll = "eza -l --icons --git";
    la = "eza -la --icons --git";
    tree = "eza --tree --icons";
    cat = "bat";

    #Nix stuff
    rebuild = "sudo nixos-rebuild switch --flake";
    retest = "sudo nixos-rebuild test --flake";
  };
  };
}
