{
  description = "Fuzzy Concepts in Expert Systems - Presentation";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/b86751bc4085f48661017fa226dee99fab6c651b";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    {
      self,
      nixpkgs,
      systems,
      ...
    }:
    let
      forEachSystem =
        f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});

      runtimePackages =
        pkgs: with pkgs; [
          presenterm
          python3Packages.weasyprint
          swi-prolog
          mermaid-cli
          typst
          pandoc
        ];

      presentationScript =
        pkgs:
        pkgs.writeShellScriptBin "run-presentation" ''
          has_config=""
          for arg in "$@"; do
            if [ "$arg" = "--config-file" ]; then
              has_config=1
              break
            fi
          done

          if [ -z "$has_config" ]; then
            set -- --config-file ${self}/config.yaml "$@"
          fi

          exec presenterm "$@" "$PWD/fuzzy-presentation.md"
        '';
    in
    {
      devShells = forEachSystem (pkgs: {
        default = pkgs.mkShell {
          buildInputs = (runtimePackages pkgs) ++ [ (presentationScript pkgs) ];
        };
      });
    };
}
