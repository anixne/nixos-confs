{ ... }:
{
 
  hls = {
    initialization_options = {
      haskell = {
        formattingProvider = "fourmolu";
        cabalFormattingProvider = "cabal-fmt";

        plugin = {
          hlint.globalOn = true;
          importLens.globalOn = true;
          eval.globalOn = true;
          ghcide-completions.globalOn = true;
          moduleName.globalOn = true;
          ghcide-code-actions-bindings.globalOn = true;
          signatureHelp.globalOn = true;
          ghcide-type-lenses.globalOn = true;
          ghcide-hover-and-symbols.globalOn = true;
          class.globalOn = true;
        };
      };
    };
  };

  nixd = {
    binary = {
      ignore_system_version = false;
    };
    settings = {
      formatting = {
        command = [
          "alejandra"
        ];
      };
      diagnostic = {
        suppress = [
          "sema-extra-with"
          "sema-extra-rec"
        ];
      };
      autoArchive = true;
    };
  };
}
