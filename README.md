# Fuzzy Concepts in Expert Systems: A Paper Review

> A presentation held at the Timișoara Polytechnic University in 17 of April,
> 2026

This repository hosts the contents of the presentation and a complimentary nix
flake to replicate the tools and configuration used for the presentation itself.

> [!NOTE]
>
> You can have a sense (with no videos, transitions, pauses nor interactivity)
> of how the presentation would appear by looking at its
> [exported pdf version](https://github.com/de-abreu/fuzzy-presentation/blob/main/fuzzy-presentation.pdf).

## How to run

### Using Nix Flakes

With [nix installed](https://nixos.org/download/) and
[flakes enabled](https://nixos.wiki/wiki/flakes), execute the following commands
in your terminal:

```bash
git clone https://github.com/de-abreu/fuzzy-presentation.git
cd fuzzy-presentation
nix develop
run-presentation
```

You might also setup presenterm options as arguments:

```bash
run-presentation --theme gruvbox-dark
```

> [!NOTE]
>
> For more information on presenterm options, check `presenterm --help`

### Using whichever package manager is supported by your distribution

These are the dependencies of this project, for you to install however you see
fit.

#### Obligatory

| Package     | Version |
| :---------- | :------ |
| presenterm  | 0.15.1  |
| typst       | 0.14.2  |
| pandoc      | 3.7.0.2 |
| mermaid-cli | 11.12.0 |
| swi-prolog  | 9.2.9   |

#### Optional

If you would like to
[export pdfs of the presentation](https://mfontanini.github.io/presenterm/features/exports.html?highlight=export#exporting-presentations)

| Package    | Version |
| :--------- | :------ |
| python     | 3.11.15 |
| weasyprint | 68.0    |

#### Cloning the repository and launching the presentation

```bash
git clone https://github.com/de-abreu/fuzzy-presentation.git
cd fuzzy-presentation
presenterm --config-file config.yaml fuzzy-presentation.md
```
