# Omarchy Theme Collection

Six Omarchy themes collected for easy installation:

- Adrift
- Aquila Noctis
- Azure
- Brutalism
- GT3 Nocturne
- Rain District

## Install

Clone the repository and run the installer:

```bash
git clone https://github.com/AbdulazizAyalew/omarchy-theme-collection.git
cd omarchy-theme-collection
./install.sh
```

The installer copies the themes into `~/.config/omarchy/themes`. Existing
folders with the same names are backed up under
`~/.local/state/omarchy-theme-collection/backups/` before replacement.

Apply a theme after installation:

```bash
omarchy theme set "GT3 Nocturne"
```

Or install and apply one in a single step:

```bash
./install.sh --apply gt3-nocturne
```

Valid slugs are `adrift`, `aquila-noctis`, `azure`, `brutalism`,
`gt3-nocturne`, and `rain-district`.

## Agent prompt

Your friend can give their agent this instruction:

> Clone `https://github.com/AbdulazizAyalew/omarchy-theme-collection`, review
> its README and installer, run `./install.sh`, then apply the theme I choose
> with `omarchy theme set`.

## Credits and licenses

This is a collection, not a claim of authorship over every included work.
Adrift, Azure, and Brutalism retain their upstream documentation and license
terms. The Nocturne theme folders contain `SOURCE.md` files crediting and
linking their wallpaper photographers. See [THIRD_PARTY.md](THIRD_PARTY.md)
for upstream repositories and exact revisions.

There is no single collection-wide license. Each theme's own license and
source notices apply to that theme and its assets.
