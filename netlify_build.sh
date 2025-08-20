#!/usr/bin/env bash
set -euo pipefail

# Install Flutter once in the Netlify build cache dir
if [ ! -d "$HOME/flutter" ]; then
  curl -L "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.35.1-stable.tar.xz" \
  | tar -xJ -C "$HOME"
fi
export PATH="$HOME/flutter/bin:$PATH"
flutter --version

flutter pub get

flutter build web --release \
  --dart-define=API_BASE_URL="${API_BASE_URL:-}" \
  --pwa-strategy=offline-first
