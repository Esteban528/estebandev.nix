{pkgs, ...}: let
  CaptureArea = pkgs.writeShellScriptBin "CaptureArea" ''
    SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
    FILENAME="$(date +'%Y%m%d_%H%M%S_grim.png')"
    FILE="$SCREENSHOT_DIR/$FILENAME"

    mkdir -p "$SCREENSHOT_DIR"

    grim -g "$(slurp)" "$FILE"
    wl-copy < "$FILE"

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
