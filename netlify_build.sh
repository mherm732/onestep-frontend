#!/usr/bin/env bash
set -euo pipefail
FLUTTER_VERSION="${FLUTTER_VERSION:-3.22.2}"

curl -L "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz" \
  | tar -xJ
export PATH="$PWD/flutter/bin:$PATH"

flutter --version
flutter pub get
flutter build web --release --dart-define=API_BASE_URL="${API_BASE_URL}"
