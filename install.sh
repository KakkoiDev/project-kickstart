#!/usr/bin/env bash
set -euo pipefail

# project-kickstart installer
# Usage: curl -fsSL https://raw.githubusercontent.com/KakkoiDev/project-kickstart/main/install.sh | bash

INSTALL_DIR="${PROJECT_KICKSTART_DIR:-$HOME/.project-kickstart}"
REPO="KakkoiDev/project-kickstart"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/$REPO/$BRANCH"

# Colors (disabled if not a terminal)
if [ -t 1 ]; then
  GREEN='\033[0;32m'
  YELLOW='\033[0;33m'
  RED='\033[0;31m'
  BOLD='\033[1m'
  NC='\033[0m'
else
  GREEN='' YELLOW='' RED='' BOLD='' NC=''
fi

info()  { printf '%s[ok]%s %s\n' "$GREEN" "$NC" "$1"; }
warn()  { printf '%s[!!]%s %s\n' "$YELLOW" "$NC" "$1"; }
error() { printf '%s[error]%s %s\n' "$RED" "$NC" "$1" >&2; exit 1; }

# --- Help ---
if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  printf "project-kickstart installer\n\n"
  printf "Usage:\n"
  printf "  curl -fsSL https://raw.githubusercontent.com/KakkoiDev/project-kickstart/main/install.sh | bash\n"
  printf "  bash install.sh [--help] [--uninstall]\n\n"
  printf "Environment:\n"
  printf "  PROJECT_KICKSTART_DIR  Install location (default: \$HOME/.project-kickstart)\n"
  exit 0
fi

# --- Uninstall ---
if [[ "${1:-}" == "--uninstall" ]]; then
  printf "Removing project-kickstart...\n"
  rm -rf "$INSTALL_DIR"
  rm -f "$HOME/.local/bin/pkstart"
  rm -rf "$HOME/.claude/skills/project-kickstart-scope"
  rm -rf "$HOME/.claude/skills/project-kickstart-trd"
  rm -f "$HOME/.claude/agents/project-kickstart-scope.md"
  rm -f "$HOME/.claude/agents/project-kickstart-trd.md"
  info "Uninstalled."
  exit 0
fi

# Detect local repo (when running install.sh from a cloned repo)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOCAL_REPO=""
if [ -f "$SCRIPT_DIR/bin/pkstart" ] && [ -d "$SCRIPT_DIR/templates" ]; then
  LOCAL_REPO="$SCRIPT_DIR"
fi

download() {
  local url="$1" dest="$2"
  local rel_path="${url#"$BASE_URL/"}"
  mkdir -p "$(dirname "$dest")"
  if [ -n "$LOCAL_REPO" ] && [ -f "$LOCAL_REPO/$rel_path" ]; then
    cp "$LOCAL_REPO/$rel_path" "$dest"
  elif command -v curl &>/dev/null; then
    curl -fsSL "$url" -o "$dest"
  elif command -v wget &>/dev/null; then
    wget -qO "$dest" "$url" || { rm -f "$dest"; return 1; }
  else
    error "Neither curl nor wget found. Install one and retry."
  fi
}

# --- Main ---
printf '\n%sproject-kickstart installer%s\n\n' "$BOLD" "$NC"

# Install pkstart CLI
download "$BASE_URL/bin/pkstart" "$INSTALL_DIR/bin/pkstart"
chmod +x "$INSTALL_DIR/bin/pkstart"
LOCAL_BIN="$HOME/.local/bin"
mkdir -p "$LOCAL_BIN"
ln -sf "$INSTALL_DIR/bin/pkstart" "$LOCAL_BIN/pkstart"
info "pkstart -> $LOCAL_BIN/pkstart"

# Write version marker
printf "%s" "$(date -u +%Y-%m-%dT%H:%M:%SZ)" > "$INSTALL_DIR/.installed"

# Summary
printf '\n%sDone.%s\n\n' "$BOLD" "$NC"
printf "  Run 'pkstart --help' to get started.\n"
printf "\n"
printf '  %sQuick start:%s\n' "$BOLD" "$NC"
printf "  pkstart init              Copy all templates into your project\n"
printf "  pkstart skills            Install Claude Code skills\n"
printf "  pkstart agents            Install Claude Code agents\n"
printf "  pkstart guides            Copy guides to current dir\n"
printf "  pkstart update            Download latest templates from GitHub\n"
printf "\n"
