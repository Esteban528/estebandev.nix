{pkgs, ...}: let
  volumecontrol = pkgs.writeShellScriptBin "volumecontrol" ''
    # You can call this script like this:
    # volumecontrol up
    # volumecontrol down
    # volumecontrol mute

    function get_volume {
      amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
    }

    function is_mute {
      amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off >/dev/null
    }

    function send_notification {
      volume=$(get_volume)
      # Make the bar with the special character ─ (it's not dash -)
      # https://en.wikipedia.org/wiki/Box-drawing_character
      if [ "$volume" = "0" ]; then
        icon_name="/usr/share/icons/Papirus/16x16/legacy/audio-volume-muted.png"
        notify-send -i "$icon_name" -r 5556 -u normal "$volume"
      else
        if [ "$volume" -lt "10" ]; then
          icon_name="/usr/share/icons/Papirus/16x16/legacy/audio-volume-low.png"
          notify-send -i "$icon_name" -r 5556 -u normal "$volume"
        else
          if [ "$volume" -lt "30" ]; then
            icon_name="/usr/share/icons/Papirus/16x16/legacy/audio-volume-low.png"
          else
            if [ "$volume" -lt "70" ]; then
              icon_name="/usr/share/icons/Papirus/16x16/legacy/audio-volume-medium.png"
            else
              icon_name="/usr/share/icons/Papirus/16x16/legacy/audio-volume-high.png"
            fi
          fi
        fi
      fi
      bar=$(seq -s "─" $(($volume / 5)) | sed 's/[0-9]//g')
      # Send the notification
      notify-send i "$icon_name" -r 5556 -u normal "$bar  $volume"
    }

    case $1 in
    up)
      # Set the volume on (if it was muted)
      amixer set Master 2%+ unmute
      send_notification
      canberra-gtk-play -i audio-volume-change
      ;;
    down)
      # amixer set Master on >/dev/null
      amixer set Master 2%- unmute
      send_notification
      canberra-gtk-play -i audio-volume-change
      ;;
    set)
      # amixer set Master on >/dev/null
      amixer set Master $2% unmute
      send_notification
      canberra-gtk-play -i audio-volume-change
      ;;
    mute)
      # Toggle mute
      amixer set Master toggle
      if is_mute; then
        notify-send -i "/usr/share/icons/Adwaita/16x16/legacy/audio-volume-muted.png" -r 5556 -u normal "$bar Audio Muted"
      else
        send_notification
        canberra-gtk-play -i audio-volume-change
      fi
      ;;
    *)
      if is_mute; then
        echo "0"
      else
        printf "%s" "$(get_volume)"
      fi

      ;;
    esac

    eww update volume=$(get_volume)
  '';
in {
  home.packages = [volumecontrol];
}
