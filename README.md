# Fuzzy Concepts in Expert Systems: A Paper Review

> A presentation held at the Timișoara Polytechnic University in 17 of April,
> 2026

This repository hosts the contents of the presentation and its complimentary
flake and devenv configuration to replicate the tools and configuration used for
the presentation itself.

> [!NOTE]
>
> You can have a sense (with no videos, transitions, pauses nor interactivity)
> of how the presentation would appear by looking at its
> [exported pdf version](https://raw.githubusercontent.com/de-abreu/sensors-presentation/refs/heads/main/embedded-systems-presentation.pdf).

## How to run

### Using [Nix Flakes](https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html)

```bash
nix run github:de-abreu/fuzzy-presentation
```

> [!NOTE]
>
> This way all data will be stored in your nix-store and later garbage collected
> automatically (if garbage collection is setup).

### Using [devenv](https://devenv.sh/)

```bash
git clone github:de-abreu/fuzzy-presentation \
&& cd sensors-presentation \
&& devenv shell -- run
```

> [!NOTE]
>
> To enter a development environment instead of just running the presentation,
> drop the `-- run` when using `devenv shell`.

### Using whichever package manager is supported by your distribution

These are the dependencies of this project, for you to install however you see
fit:

| Package     | Version |
| :---------- | :------ |
| presenterm  | 0.15.1  |
| python      | 3.11.15 |
| weasyprint  | 68.0    |
| typst       | 0.14.2  |
| pandoc      | 3.7.0.2 |
| mermaid-cli | 11.12.0 |

## Theming

To change the
[presentation theming](https://mfontanini.github.io/presenterm/features/themes/introduction.html)
you can specify a theme to use like so:

- `nix run github:de-abreu/sensors-presentation -- gruvbox-dark`
- or `devenv shell -- run gruvbox-dark`

Where `gruvbox-dark` is the theme name.
