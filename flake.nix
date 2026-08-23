{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    nixosConfigurations.kusanagi = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      # system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];
    };

    formatter.${system} = pkgs.alejandra;
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        self.formatter.${system}
        alejandra

        nixd
        statix
        deadnix
      ];
    };
  };
}
