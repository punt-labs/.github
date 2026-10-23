#!/bin/sh
# Install all Punt Labs tools and Claude Code plugins.
# Usage: curl -fsSL https://raw.githubusercontent.com/punt-labs/.github/<SHA>/install-all.sh | sh
#
# This is a thin orchestrator. Each CLI tool has its own installer that handles
# pre-flight checks, uv setup, and plugin registration independently. This
# script downloads each one and runs it in sequence, failing if a download or
# an installer fails, and adds the pure-plugin installs that have no
# standalone installer. Child installer URLs are pinned to auditable SHAs.
set -eu

# --- Colors (disabled when not a terminal) ---
if [ -t 1 ]; then
  BOLD='\033[1m' GREEN='\033[32m' YELLOW='\033[33m' NC='\033[0m'
else
  BOLD='' GREEN='' YELLOW='' NC=''
fi

info()   { printf '%b▶%b %s\n' "$BOLD" "$NC" "$1"; }
ok()     { printf '  %b✓%b %s\n' "$GREEN" "$NC" "$1"; }
warn()   { printf '  %b!%b %s\n' "$YELLOW" "$NC" "$1"; }
fail()   { printf '  %b✗%b %s\n' "$YELLOW" "$NC" "$1"; exit 1; }
banner() { printf '\n%b── %s ──%b\n\n' "$BOLD" "$1" "$NC"; }

GH="https://raw.githubusercontent.com/punt-labs"

# Download a child installer to a temp file, then run it. Piping curl into sh
# under `set -eu` (no pipefail in POSIX sh) turns a failed download into an
# empty script that exits 0, so the orchestrator would report success. Two
# steps make each failure observable. The installer reads /dev/null so it
# cannot consume this script's own stdin when we are run as `curl ... | sh`.
# The temp file is removed on every path; the INT/TERM trap is local to the
# call and reset before returning, so it never competes with the later
# cleanup_https_rewrite trap.
run_installer() {
  url="$1"
  tmp="$(mktemp)" || fail "mktemp failed; cannot run installer: $url"
  trap 'rm -f "$tmp"; exit 130' INT TERM
  if ! curl -fsSL "$url" -o "$tmp"; then
    rm -f "$tmp"
    trap - INT TERM
    fail "Download failed: $url"
  fi
  if ! sh "$tmp" < /dev/null; then
    rm -f "$tmp"
    trap - INT TERM
    fail "Installer failed: $url"
  fi
  rm -f "$tmp"
  trap - INT TERM
}

# --- Pre-flight ---

info "Checking prerequisites..."

if command -v claude >/dev/null 2>&1; then
  ok "claude CLI found"
else
  fail "'claude' CLI not found. Install Claude Code first: https://docs.anthropic.com/en/docs/claude-code"
fi

if command -v git >/dev/null 2>&1; then
  ok "git found"
else
  fail "'git' not found. Install git first: https://git-scm.com/downloads"
fi

# --- Step 1: Marketplace ---

banner "Marketplace"
run_installer "$GH/claude-plugins/04c4ca5/install.sh"

# --- Step 2: CLI tools ---
# Each installer handles its own pre-flight (Python, uv, SSH fallback).

banner "punt-kit"
run_installer "$GH/punt-kit/27de21c/install.sh"

banner "beadle"
run_installer "$GH/beadle/4cc7f6b/install.sh"

banner "biff"
run_installer "$GH/biff/6dd95cc/install.sh"

banner "quarry"
run_installer "$GH/quarry/5530609/install.sh"

banner "vox"
run_installer "$GH/vox/a1b27ab/install.sh"

banner "lux"
run_installer "$GH/lux/cf07ed7/install.sh"

banner "ethos"
run_installer "$GH/ethos/47397f8/install.sh"

banner "z-spec"
run_installer "$GH/z-spec/2d50236/install.sh"

banner "mcp-proxy"
run_installer "$GH/mcp-proxy/1817fa3/install.sh"

# --- Step 3: Pure plugins (no CLI, marketplace-only) ---

banner "Plugins"

NEED_HTTPS_REWRITE=0
cleanup_https_rewrite() {
  if [ "$NEED_HTTPS_REWRITE" = "1" ]; then
    git config --global --unset url."https://github.com/".insteadOf 2>/dev/null || true
    NEED_HTTPS_REWRITE=0
  fi
}
trap cleanup_https_rewrite EXIT INT TERM

if ! ssh -n -o StrictHostKeyChecking=accept-new -o BatchMode=yes -o ConnectTimeout=5 -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
  if ! git config --global --get url."https://github.com/".insteadOf >/dev/null 2>&1; then
    warn "SSH auth to GitHub unavailable, using HTTPS fallback"
    git config --global url."https://github.com/".insteadOf "git@github.com:"
    NEED_HTTPS_REWRITE=1
  fi
fi

for plugin in prfaq dungeon; do
  info "Installing $plugin plugin..."
  claude plugin uninstall "$plugin@punt-labs" < /dev/null 2>/dev/null || true
  if claude plugin install "$plugin@punt-labs" --scope user < /dev/null 2>/dev/null; then
    ok "$plugin"
  else
    warn "Failed to install $plugin (install manually: claude plugin install $plugin@punt-labs)"
  fi
done

cleanup_https_rewrite

# --- Done ---

printf '\n%b%bAll Punt Labs tools are installed!%b\n\n' "$GREEN" "$BOLD" "$NC"
printf 'CLIs:    beadle, biff, ethos, lux, mcp-proxy, punt, quarry, vox, z-spec\n'
printf 'Plugins: biff, dungeon, ethos, lux, prfaq, punt, quarry, vox, z-spec\n\n'
printf 'Restart Claude Code twice to activate all plugins.\n\n'
