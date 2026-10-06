#!/usr/bin/env bash

set -euo pipefail

readonly collection_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly source_dir="$collection_dir/themes"
readonly destination_root="${HOME}/.config/omarchy/themes"
readonly backup_root="${XDG_STATE_HOME:-${HOME}/.local/state}/omarchy-theme-collection/backups"
readonly -a theme_slugs=(
  adrift
  aquila-noctis
  azure
  brutalism
  gt3-nocturne
  rain-district
)

apply_theme=""

usage() {
  printf 'Usage: %s [--apply THEME-SLUG]\n' "${0##*/}"
}

if (( $# > 0 )); then
  if [[ ${1:-} != "--apply" || $# -ne 2 ]]; then
    usage >&2
    exit 2
  fi
  apply_theme="$2"
fi

if [[ -n $apply_theme ]]; then
  valid=false
  for theme in "${theme_slugs[@]}"; do
    if [[ $theme == "$apply_theme" ]]; then
      valid=true
      break
    fi
  done
  if [[ $valid != true ]]; then
    printf 'Unknown theme slug: %s\n' "$apply_theme" >&2
    usage >&2
    exit 2
  fi
fi

mkdir -p -- "$destination_root"
timestamp="$(date +%Y%m%d-%H%M%S)"

for theme in "${theme_slugs[@]}"; do
  source_path="$source_dir/$theme"
  destination_path="$destination_root/$theme"

  if [[ ! -d $source_path ]]; then
    printf 'Missing source theme: %s\n' "$source_path" >&2
    exit 1
  fi

  if [[ -e $destination_path ]]; then
    mkdir -p -- "$backup_root/$timestamp"
    mv -- "$destination_path" "$backup_root/$timestamp/$theme"
    printf 'Backed up %s\n' "$theme"
  fi

  cp -a -- "$source_path" "$destination_path"
  printf 'Installed %s\n' "$theme"
done

if [[ -n $apply_theme ]]; then
  if ! command -v omarchy >/dev/null 2>&1; then
    printf 'Themes installed, but the omarchy command was not found.\n' >&2
    exit 1
  fi
  omarchy theme set "$apply_theme"
fi

printf 'Done. Apply a theme with: omarchy theme set "Theme Name"\n'
