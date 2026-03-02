#!/usr/bin/env bash
set -euo pipefail

# project-kickstart installer
# Usage: curl -fsSL https://raw.githubusercontent.com/KakkoiDev/project-kickstart/main/install.sh | bash

INSTALL_DIR="${PROJECT_KICKSTART_DIR:-$HOME/.project-kickstart}"
CLAUDE_SKILLS_DIR="$HOME/.claude/skills"
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
  rm -rf "$CLAUDE_SKILLS_DIR/project-kickstart-scope"
  rm -rf "$CLAUDE_SKILLS_DIR/project-kickstart-trd"
  info "Uninstalled."
  exit 0
fi

# --- Templates ---
TEMPLATES=(
  "PROJECT_BRIEF_TEMPLATE.md"
  "PROJECT_SCOPING_CHECKLIST.md"
  "TRD_TEMPLATE.md"
  "CHANGE_REQUEST.md"
)

# --- Guides ---
GUIDES=(
  "PROJECT_BRIEFING_GUIDE.md"
  "PROJECT_SCOPING_GUIDE.md"
  "TRD_GUIDE.md"
)

# --- Skills (Claude Code) ---
SKILLS=(
  "project-kickstart-scope"
  "project-kickstart-trd"
)

download() {
  local url="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if command -v curl &>/dev/null; then
    curl -fsSL "$url" -o "$dest"
  elif command -v wget &>/dev/null; then
    wget -qO "$dest" "$url" || { rm -f "$dest"; return 1; }
  else
    error "Neither curl nor wget found. Install one and retry."
  fi
}

# --- Main ---
printf '\n%sproject-kickstart installer%s\n\n' "$BOLD" "$NC"

# 1. Install templates
printf "Installing templates to %s/templates/\n" "$INSTALL_DIR"
for file in "${TEMPLATES[@]}"; do
  download "$BASE_URL/templates/$file" "$INSTALL_DIR/templates/$file"
  info "$file"
done

# 2. Install guides
printf "\nInstalling guides to %s/guides/\n" "$INSTALL_DIR"
for file in "${GUIDES[@]}"; do
  download "$BASE_URL/guides/$file" "$INSTALL_DIR/guides/$file"
  info "$file"
done

# 3. Install Claude Code skills (optional)
printf "\n"
if [ -d "$HOME/.claude" ]; then
  printf "Installing Claude Code skills to %s/\n" "$CLAUDE_SKILLS_DIR"
  for skill in "${SKILLS[@]}"; do
    download "$BASE_URL/skills/$skill/SKILL.md" "$CLAUDE_SKILLS_DIR/$skill/SKILL.md"
    info "/""$skill"
  done
else
  warn "\$HOME/.claude not found. Skipping Claude Code skills."
  warn "Run 'claude' once to initialize, then re-run this installer."
fi

# 4. Write version marker
printf "%s" "$(date -u +%Y-%m-%dT%H:%M:%SZ)" > "$INSTALL_DIR/.installed"

# 5. Summary
printf '\n%sDone.%s\n\n' "$BOLD" "$NC"
printf "  Templates + guides: %s/\n" "$INSTALL_DIR"
if [ -d "$HOME/.claude" ]; then
  printf "  Claude Code skills: /project-kickstart-scope, /project-kickstart-trd\n"
fi
printf "\n"
printf '  %sWorkflow:%s\n' "$BOLD" "$NC"
printf "  Brief (human) -> /project-kickstart-scope -> Checklist -> /project-kickstart-trd -> TRD -> PRs\n"
printf "\n"

# 6. Optional: git-dispatch
printf '  %sOptional:%s git-dispatch (TRD tasks -> stacked PRs)\n' "$BOLD" "$NC"
printf "  Install separately: https://github.com/KakkoiDev/git-dispatch\n"
printf "  Without it: create one branch per TRD task manually.\n"
printf "\n"
