{
  description = "Fuzzy Concepts in Expert Systems - Presentation";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/b86751bc4085f48661017fa226dee99fab6c651b";
    devenv.url = "github:cachix/devenv";
  };

  outputs =
    {
      self,
      nixpkgs,
      devenv,
      ...
    }@inputs:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = devenv.lib.mkShell {
            inherit inputs pkgs;
            modules = [ ./devenv.nix ];
          };
        }
      );

      apps = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          runtimePackages = with pkgs; [
            presenterm
            swi-prolog
            mermaid-cli
            typst
            pandoc
          ];
        in
        {
          default = {
            type = "app";
            program = toString (
              pkgs.writeShellScript "run-presentation" ''
                export PATH="${pkgs.lib.makeBinPath runtimePackages}:$PATH"
                theme_args=""
                if [ -n "$1" ]; then
                  theme_args="--theme $1"
                fi
                presenterm --config-file ${self}/config.yaml $theme_args ${self}/fuzzy-presentation.md
              ''
            );
          };
        }
      );
    };
}
