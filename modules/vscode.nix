{ pkgs, ... }: 

{
  programs.vscode = {
    enable = true;
    
    extensions = with pkgs.vscode-extensions; [
      haskell.haskell
      justusadam.language-haskell
    ];
    
    userSettings = {
      haskell.formattingProvider = "fourmolu";
      haskell.manageHLS = "PATH";
      "files.associations"."*.hs" = "haskell";
      "files.associations"."*.dump-simpl" = "haskell";
    };
  };
}
