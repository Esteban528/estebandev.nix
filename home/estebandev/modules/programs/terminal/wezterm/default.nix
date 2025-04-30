{
  config,
  lib,
  ...
}: let
  colors = config.lib.stylix.colors;
in {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
        local wezterm = require("wezterm")

        local config = {}

        if wezterm.config_builder then
          config = wezterm.config_builder()
        end

        -- config.window_padding = {
        --   top = 8,
        --   bottom = 0,
        --   right = 8,
        --   left = 8,
        -- }

        -- Background
        config.window_background_opacity = 0.98 

        -- UI
        config.font_size = 10
        config.font = wezterm.font {
          family = 'Hack Nerd Font',
          --family = 'Fira Code Nerd Font',
          -- weight = 'Regular',
        }
        config.hide_tab_bar_if_only_one_tab = true
        config.max_fps = 240 
        config.enable_kitty_graphics = true
        config.enable_tab_bar = false
        config.window_close_confirmation = 'NeverPrompt'
        config.default_prog = { "bash" }

        return config
    '';
  };
}
