{
  enable_animations,
  color1,
  color2,
}: ''
  # __  ___       __  ___       __
  #/__`  |   /\  |__)  |  |  | |__)
  #.__/  |  /~~\ |  \  |  \__/ |
  #


  exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP # for XDPH
  exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP # for XDPH
  exec-once = etc/xdg/autostart/polkit-gnome-authentication-agent-1.desktop
  # exec-once = waybar
  # exec-once = eww daemon
  # exec-once = hyprpaper
  exec-once = swww-daemon
  exec-once = hypridle
  # exec-once = discord --start-minimized
  # exec-once = vesktop --start-minimized
  exec-once = notion-app
  # exec-once = eww open bar0
  exec-once = /home/estebandev/.config/eww/scripts/start.sh
  # exec-once = /home/estebandev/Dev/bin/Calendar/todo.sh

  # exec-once = gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-dark"
  # exec-once = gsettings set org.gnome.desktop.interface gtk-theme "Gruvbox-Dark-hdpi-BL-MB"

  # __   __        ___    __
  #/  ` /  \ |\ | |__  | / _`
  #\__, \__/ | \| |    | \__>
  #

  # monitor=eDP-1,1920x1080,0x0,1
  monitor=HDMI-A-2,1920x1080@75,0x0,1
  monitor=DP-1,1280x720@60,1920x100,1
  # monitor=DP-1,1280x720@60,1920x0,1,transform,1

  workspace=1,monitor:HDMI-A-2
  workspace=2,monitor:HDMI-A-2
  workspace=3,monitor:HDMI-A-2
  workspace=4,monitor:HDMI-A-2
  workspace=5,monitor:HDMI-A-2
  workspace=6,monitor:HDMI-A-2
  workspace=7,monitor:HDMI-A-2
  workspace=8,monitor:DP-1
  workspace=9,monitor:DP-1, gapsin:0, gapsout:0, border:false, decorate:true
  workspace=10,monitor:DP-1,rounding:false, decorate:false, gapsin:0, gapsout:0, border:false, decorate:false

  input {
      kb_layout = latam
      kb_variant =
      kb_model = es
      kb_options =
      kb_rules =

      follow_mouse = 1
  }

  general {
      gaps_in = 0
      gaps_out = 0
      border_size = 2
      col.active_border = rgb(${color1})
      col.inactive_border = rgb(${color2})


      layout = master
      # layout = dwindle

      allow_tearing = false
  }

  decoration {
      rounding = 0

      blur {
          enabled = false
          size = 3
          passes = 2

          vibrancy = 0.1696
      }

      # shadow_range = 0
      # shadow_render_power = 0
      # col.shadow = rgba(00000099)
  }

  animations {
      enabled = true
      first_launch_animation = true

      # bezier = myBezier, 0.05, 0.9, 0.1, 1.05
      #
      # animation = windows, 1, 6, default, slide
      # animation = windowsOut, 1, 12, default, popin
      # animation = border, 1, 10, default,
      # animation = borderangle, 1, 12, default
      animation = fade, 1, 6, default
      # animation = workspaces, 1, 8, default, slidefade
  }

  dwindle {
      pseudotile = true
      preserve_split = true
  }

  master {
      # new_is_master = false
  }

  gestures {
      # workspace_swipe = true
  }

  misc {
      force_default_wallpaper = 0
  }

  # Window rules

  windowrule=float,^(galculator)$
  windowrule=float,^(org.gnome.Nautilus)$
  windowrulev2 = size 40% 50%,class:(org.gnome.Nautilus),
  windowrulev2 = move 50% 30%,class:(org.gnome.Nautilus),
  #      ___      __          __   __
  #|__/ |__  \ / |__) | |\ | |  \ /__`
  #|  \ |___  |  |__) | | \| |__/ .__/
  #

  # Default applications
  $terminal = wezterm
  $TermFileManager = $terminal start yazi
  $fileManager = nautilus
  $menu = wofi --show drun
  $webBrowser = brave
  $lockScreen = hyprlock
  $mainMod = SUPER
  $editor = code

  # WM bindings
  bind = $mainMod, Q, killactive
  bind = SUPER_SHIFT, Q, exit
  bind = $mainMod, F, togglefloating
  bind = SUPER_SHIFT, F, fullscreen
  bind = $mainMod, T, pseudo # dwindle
  bind = $mainMod, X, exec, hyprpicker -f hex -a
  bind = $mainMod, space, togglesplit

  # Applications
  bind = $mainMod, Return, exec, $terminal
  bind = $mainMod, D, exec, $menu
  bind = $mainMod, E, exec, $TermFileManager
  bind = SUPER_SHIFT, E, exec, $fileManager
  bind = $mainMod, N, exec, $webBrowser
  bind = $mainMod, C, exec, $editor

  # Move focus with mainMod + arrow keys
  bind = $mainMod, h, movefocus, l
  bind = $mainMod, l, movefocus, r
  bind = $mainMod, k, movefocus, u
  bind = $mainMod, j, movefocus, d

  # Switch workspaces with mainMod + [0-9]
  bind = $mainMod, 1, workspace, 1
  bind = $mainMod, 2, workspace, 2
  bind = $mainMod, 3, workspace, 3
  bind = $mainMod, 4, workspace, 4
  bind = $mainMod, 5, workspace, 5
  bind = $mainMod, 6, workspace, 6
  bind = $mainMod, 7, workspace, 7
  bind = $mainMod, 8, workspace, 8
  bind = $mainMod, 9, workspace, 9
  bind = $mainMod, 0, workspace, 10

  # Move active window to a workspace with mainMod + SHIFT + [0-9]
  bindr = SUPER_SHIFT, 1, movetoworkspace, 1
  bindr = SUPER_SHIFT, 2, movetoworkspace, 2
  bindr = SUPER_SHIFT, 3, movetoworkspace, 3
  bindr = SUPER_SHIFT, 4, movetoworkspace, 4
  bindr = SUPER_SHIFT, 5, movetoworkspace, 5
  bindr = SUPER_SHIFT, 6, movetoworkspace, 6
  bindr = SUPER_SHIFT, 7, movetoworkspace, 7
  bindr = SUPER_SHIFT, 8, movetoworkspace, 8
  bindr = SUPER_SHIFT, 9, movetoworkspace, 9
  bindr = SUPER_SHIFT, 0, movetoworkspace, 10

  # Screenshots
  bind = $mainMod SHIFT, S, exec, CaptureArea
  bind = $mainMod, print, exec, CaptureAll
  bind = ,print, exec, CaptureScreen

  # Brightness keys
  bind = ,XF86MonBrightnessDown, exec, brightnessctl set 5%-
  bind = ,XF86MonBrightnessUp, exec, brightnessctl set +5%

  # Volume keys
  bind = ,XF86AudioRaiseVolume, exec, volumecontrol up
  bind = ,XF86AudioLowerVolume, exec, volumecontrol down
  bind = ,XF86AudioMute, exec, volumecontrol mute

  # Scroll through existing workspaces with mainMod + scroll
  bind = $mainMod, mouse_down, workspace, e+1
  bind = $mainMod, mouse_up, workspace, e-1
  bind = $mainMod, Tab, workspace, e+1
  bind = $mainMod SHIFT, Tab, workspace, e-1

  # Move windows with keyboard
  bind = SUPER_SHIFT, H, movewindow, l
  bind = SUPER_SHIFT, L, movewindow, r
  bind = SUPER_SHIFT, K, movewindow, u
  bind = SUPER_SHIFT, J, movewindow, d

  # Resize windows with keyboard
  bind = SUPER_CTRL, H, resizeactive, -10 0
  bind = SUPER_CTRL, L, resizeactive, 10 0
  bind = SUPER_CTRL, K, resizeactive, 0 -10
  bind = SUPER_CTRL, J, resizeactive, 0 10

  # Lock screen when closing the lid
  bindl = ,switch:off:Lid Switch, exec, $lockScreen
  bind = ,XF86HomePage, exec, $lockScreen

  # Move/resize windows with mainMod + LMB/RMB and dragging
  bindm = $mainMod, mouse:272, movewindow
  bindm = $mainMod, mouse:273, resizewindow
''
