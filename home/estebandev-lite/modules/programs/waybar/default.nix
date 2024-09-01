{
  pkgs,
  config,
  ...
}: let
  colors = config.lib.stylix.colors;
in {
  home.packages = with pkgs; [
    waybar
  ];

  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
      * {
        font-family: "Fira Code Nerd Font";
        font-size: 10pt;
        font-weight: bold;
        transition-property: background-color;
        transition-duration: 0.5s;
      }

    '';
    settings = [{
      "layer" = "top";
      modules-left = [
        "custom/arch"
        "hyprland/workspaces"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "backlight"
        "pulseaudio"
        "bluetooth"
        "network"
        "battery"
      ];
      "custom/arch" = {
        "format" = " 󱄅 ";
        "tooltip" = false;
      };
      "hyprland/workspaces" = {
        "format" = "<span color='#${colors.base0E}'>{name} </span>";
        "tooltip" = false;
        "all-outputs" = true;
        "format-icons" = {
          "active" = "";
          "default" = "";
        };
        "clock" = {
          "format" = "<span color='#${colors.base0D}'> </span>{:%H:%M}";
        };
        "backlight" = {
          "device" = "intel_backlight";
          "format" = "<span color='#${colors.base0D}'>{icon}</span> {percent}%";
          "format-icons" = ["" "" "" "" "" "" "" "" ""];
        };
        "pulseaudio" = {
          "format" = "<span color='#${colors.base0D}'>{icon}</span> {volume}%";
          "format-muted" = "";
          "tooltip" = false;
          "format-icons" = {
            "headphone" = "";
            "default" = ["" "" "󰕾" "󰕾" "󰕾" "" "" ""];
          };
          "scroll-step" = 1;
        };
        "bluetooth" = {
          "format" = "<span color='#${colors.base0D}'></span> {status}";
          "format-disabled" = "";
          "format-connected" = "<span color='#${colors.base0D}'></span> {num_connections}";
          "tooltip-format" = "{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias} {device_address}";
        };
        "network" = {
          "interface" = "wlp3s0";
          "format" = "{ifname}";
          "format-wifi" = "<span color='#${colors.base0D}'> </span>{essid}";
          "format-ethernet" = "{ipaddr}/{cidr} 󰈀";
          "format-disconnected" = "<span color='#${colors.base0D}'>󰖪 </span>No Network";
          "tooltip" = false;
        };
        "battery" = {
          "format" = "<span color='#${colors.base0D}'>{icon}</span> {capacity}%";
          "format-icons" = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󱟢"];
          "format-charging" = "<span color='#${colors.base0D}'>󰂄</span> {capacity}%";
          "tooltip" = false;
        };
      }
    ];
  };
}
