#!/usr/bin/env bash
set -e

PORT=1498
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

trap 'echo "Server stopped."; exit 0' SIGINT SIGTERM

cd "$SCRIPT_DIR"
echo "Serving PosterPageGen at http://localhost:$PORT"

if command -v xdg-open &>/dev/null; then
  xdg-open "http://localhost:$PORT" 2>/dev/null || true
fi

python3 -m http.server "$PORT"
