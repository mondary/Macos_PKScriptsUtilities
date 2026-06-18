#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
APP_NAME="Macos_PKScriptsUtilities"
APP_DIR="$ROOT_DIR/release/${APP_NAME}.app"
CONTENTS_DIR="$APP_DIR/Contents"
MACOS_DIR="$CONTENTS_DIR/MacOS"
RESOURCES_DIR="$CONTENTS_DIR/Resources"

rm -rf "$APP_DIR"
mkdir -p "$MACOS_DIR" "$RESOURCES_DIR"

swiftc -O -framework Cocoa "$SCRIPT_DIR/main.swift" -o "$MACOS_DIR/$APP_NAME"
cp "$SCRIPT_DIR/Info.plist" "$CONTENTS_DIR/Info.plist"

cp "$ROOT_DIR/src/snippets/"*.sh "$ROOT_DIR/"

chmod +x "$MACOS_DIR/$APP_NAME"

printf "Built %s\n" "$APP_DIR"
