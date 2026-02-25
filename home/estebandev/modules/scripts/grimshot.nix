{pkgs, ...}: let
CaptureArea = pkgs.writeShellScriptBin "CaptureArea" ''
  set -euo pipefail

  SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
  mkdir -p "$SCREENSHOT_DIR"

  FILENAME="$(date +'%Y%m%d_%H%M%S_grim.png')"
  FILE="$SCREENSHOT_DIR/$FILENAME"

  HYPRPICKER_PID=""

  cleanup() {
    # si hyprpicker sigue vivo, lo matamos
    if [ -n "''${HYPRPICKER_PID:-}" ] && kill -0 "$HYPRPICKER_PID" 2>/dev/null; then
      kill "$HYPRPICKER_PID" 2>/dev/null || true
    fi
  }
  trap cleanup EXIT INT TERM

  # Freeze (si funciona en tu sway, perfecto)
  hyprpicker -r -z >/dev/null 2>&1 &
  HYPRPICKER_PID="$!"
  sleep 0.2

  GEOM="$(slurp -d)" || exit 1
  [ -z "$GEOM" ] && exit 1

  grim -g "$GEOM" "$FILE"
  wl-copy --type image/png < "$FILE"

  notify-send "Screenshot taken" "$FILENAME" -t 2000 -i "$FILE"
'';

  CaptureAll = pkgs.writeShellScriptBin "CaptureAll" ''
    FILE="$HOME/Pictures/Screenshots/$(date +'%Y%m%d_%H%M%S_grim.png')"

    mkdir -p "$(dirname "$FILE")"

    grim "$FILE"
    wl-copy < "$FILE"

    notify-send "Screenshot taken" "$FILENAME" -t 2000 -i "$FILE"
  '';

  CaptureScreen = pkgs.writeShellScriptBin "CaptureScreen" ''
    FILE="$HOME/Pictures/Screenshots/$(date +'%Y%m%d_%H%M%S_grim.png')"

    mkdir -p "$(dirname "$FILE")"

    grim -g "$(slurp -o)" "$FILE"
    wl-copy < "$FILE"

    notify-send "Screenshot taken" "$FILENAME" -t 2000 -i "$FILE"
  '';
in {
  home.packages = [CaptureArea CaptureAll CaptureScreen];
}
