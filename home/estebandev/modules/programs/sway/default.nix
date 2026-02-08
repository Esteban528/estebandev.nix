{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    grim # screenshot functionality
    slurp # screenshot functionality
    grimblast
    hyprpicker
    swaybg
    # mako # notification system developed by swaywm maintainer
    # swaync
  ];
  services.mako.enable = true;

  programs.fuzzel.enable = true;
  wayland.windowManager.sway = {
    enable = true;

    config = rec {
      modifier = "Mod4";
      terminal = "foot -e /home/estebandev/.tmux/init-session.sh";
      menu = "fuzzel";

      input = {
        "type:keyboard" = {
          xkb_layout = "latam";
        };

        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
        };
      };

      output = {
        "HDMI-A-2" = {
          resolution = "1920x1080";
          position = "1920,0";
          mode = "1920x1080@75Hz";
        };
      };

      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+q" = "kill";
        "${modifier}+d" = "exec ${menu}";
        "${modifier}+n" = "exec librewolf";
        "${modifier}+Shift+e" = "exec thunar";
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+q" = ''
          exec swaynag -t warning -m "You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session." \
            -B "Yes, exit sway" "swaymsg exit"
        '';

        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";

        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";
        # Layout
        "${modifier}+b" = "splith";
        "${modifier}+v" = "splitv";
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";
        "${modifier}+Shift+f" = "fullscreen";
        "${modifier}+f" = "floating toggle";
        "${modifier}+space" = "focus mode_toggle";
        "${modifier}+a" = "focus parent";

        # Scratchpad
        "${modifier}+Shift+minus" = "move scratchpad";
        "${modifier}+minus" = "scratchpad show";

        # Resize mode
        "${modifier}+r" = ''mode "resize"'';

        # Utilidades (volumen, brillo, screenshot, hyprpicker, suspend)
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
        "Shift+Print" = "exec CaptureAll";
        "${modifier}+Shift+s" = "exec CaptureArea";
        "XF86HomePage" = "exec systemctl suspend";
        "${modifier}+x" = "exec hyprpicker -f hex -a";
      };

      # gaps
      gaps = {
        inner = 5;
        outer = 5;
      };

      bars = [];
    };
    extraConfig = ''
      default_border pixel 
      default_floating_border pixel
      set $opacity 0.97
      for_window [class=".*"] opacity $opacity
      for_window [app_id=".*"] opacity $opacity

      exec systemctl --user import-environment PATH
      exec systemctl --user restart xdg-desktop-portal.service
      exec tmux start-server
      exec swaybg --image /home/estebandev/Pictures/wallpaper/wallhaven-5gql97.jpg
      exec swayidle -w \
        timeout 300 'swaylock -f -c 000000' \
        timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
        before-sleep 'swaylock -f -c 000000'
      include /etc/sway/config.d/*
    '';
  };
}
