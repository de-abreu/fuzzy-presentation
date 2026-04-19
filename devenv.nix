{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  packages = with pkgs; [
    presenterm
    python3Packages.weasyprint
    swi-prolog
    mermaid-cli
    typst
    pandoc
  ];

  scripts.run.exec = ''
    theme_args=""
    if [ -n "$1" ]; then
      theme_args="--theme $1"
    fi
    presenterm --config-file "${config.devenv.root}/config.yaml" $theme_args "${config.devenv.root}/fuzzy-presentation.md"
  '';

}
