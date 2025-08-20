#!/usr/bin/env bash
set -euo pipefail

# 1) Config
FLUTTER_VERSION="${FLUTTER_VERSION:-3.35.1}"   # Dart >= 3.8
: "${API_BASE_URL:?API_BASE_URL not set}"      # required

# 2) Install Flutter
curl -L "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz" | tar -xJ
export PATH="$PWD/flutter/bin:$PATH"
flutter --version
flutter config --no-analytics

# 3) Go to your Flutter web app folder (adjust if different)
cd one_step_app_frontend

# 4) Build
flutter pub get
echo "API_BASE_URL=${API_BASE_URL}"
flutter build web --release --pwa-strategy=none \
  --dart-define=API_BASE_URL="${API_BASE_URL}"

# 5) Netlify will publish from repo root’s build path:
# If your publish dir in netlify.toml is "build/web" at repo root, move output up:
cd ..
rm -rf build && mkdir -p build
cp -r onestep-frontend/build/web build/web
