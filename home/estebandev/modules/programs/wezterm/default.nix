{
  config,
  lib,
  ...
}: let
  toLuaArr = arr: "{ " + (lib.strings.concatMapStringsSep ", " (i: "'${i}'") arr) + " }";
  privCmdLua = toLuaArr config.shell.privSession;
  colors = config.lib.stylix.colors;
in {
  programs.wezterm = {
    enable = true;
    colorSchemes = {
      custom = {
        background = "${colors.base01}";
        foreground = "${colors.base07}";
        cursor_bg = "${colors.base05}";
        cursor_fg = "${colors.base05}";
        cursor_border = "${colors.base05}";
        split = "${colors.base03}";
        selection_fg = "${colors.base00}";
        selection_bg = "${colors.base04}";
        ansi = [
          "${colors.base02}" # black
          "${colors.base08}" # red
          "${colors.base0B}" # green
          "${colors.base0A}" # yellow
          "${colors.base0D}" # blue
          "${colors.base09}" # magenta
          "${colors.base0C}" # cyan
          "${colors.base06}" # white
        ];

        brights = [
          "${colors.base00}" # bright black
          "${colors.base08}" # bright red
          "${colors.base0B}" # bright green
          "${colors.base0A}" # bright yellow
          "${colors.base0D}" # bright blue
          "${colors.base0E}" # bright magenta
          "${colors.base0C}" # bright cyan
          "${colors.base07}" # bright white
        ];
      };
    };
    extraConfig = ''


local wezterm = require("wezterm")

local function font_with_fallback(name, params)
  local names = { name, "Apple Color Emoji", "azuki_font" }
  return wezterm.font_with_fallback(names, params)
end

local font_name = "Jetbrains Mono NerdFont"

return {
  default_prog = { "fish" },
  
  -- OpenGL for GPU acceleration, WebGPU for better performance (debe estar en minúscula)
  front_end = "WebGpu",
  
  -- No updates
  check_for_updates = false,
  
  -- Wayland
  enable_wayland = false,
  
  -- Get rid of close prompt
  window_close_confirmation = "NeverPrompt",
  
  -- Cursor style
  default_cursor_style = "BlinkingUnderline",
  
  window_background_opacity = 0.9,
  
  -- Font configuration
  font = font_with_fallback(font_name),
  font_rules = {
    {
      italic = true,
      font = font_with_fallback(font_name, { italic = true }),
    },
    {
      italic = true,
      intensity = "Bold",
      font = font_with_fallback(font_name, { italic = true, bold = true }),
    },
    {
      intensity = "Bold",
      font = font_with_fallback(font_name, { bold = true }),
    },
  },
  
  -- Disable warning about missing glyphs
  warn_about_missing_glyphs = false,
  
  -- Font size and line height
  font_size = 10,
  line_height = 1.0,
  
  -- Color scheme
  color_scheme = "custom",
  bold_brightens_ansi_colors = true,
  
  -- Window padding
  window_padding = { left = 2, right = 2, top = 1, bottom = 1 },
  
  -- Inactive pane brightness and saturation
  inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
  
  -- Tab bar options
  enable_tab_bar = true,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = false,
  
  -- Keybinds
  disable_default_key_bindings = true,
  keys = {
    { key = "Enter", mods = "CTRL|SHIFT", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    { key = "Enter", mods = "CTRL", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    { key = "q", mods = "CTRL|SHIFT", action = wezterm.action { CloseCurrentPane = { confirm = false } } },
    { key = "h", mods = "CTRL|SHIFT", action = wezterm.action { ActivatePaneDirection = "Left" } },
    { key = "l", mods = "CTRL|SHIFT", action = wezterm.action { ActivatePaneDirection = "Right" } },
    { key = "k", mods = "CTRL|SHIFT", action = wezterm.action { ActivatePaneDirection = "Up" } },
    { key = "j", mods = "CTRL|SHIFT", action = wezterm.action { ActivatePaneDirection = "Down" } },
    { key = "h", mods = "CTRL|SHIFT|ALT", action = wezterm.action { AdjustPaneSize = { "Left", 1 } } },
    { key = "l", mods = "CTRL|SHIFT|ALT", action = wezterm.action { AdjustPaneSize = { "Right", 1 } } },
    { key = "k", mods = "CTRL|SHIFT|ALT", action = wezterm.action { AdjustPaneSize = { "Up", 1 } } },
    { key = "j", mods = "CTRL|SHIFT|ALT", action = wezterm.action { AdjustPaneSize = { "Down", 1 } } },
    
    -- Browser-like bindings for tabbing
    { key = "t", mods = "CTRL", action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
    { key = "w", mods = "CTRL|SHIFT", action = wezterm.action { CloseCurrentTab = { confirm = false } } },
    { key = "Tab", mods = "CTRL", action = wezterm.action { ActivateTabRelative = 1 } },
    { key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action { ActivateTabRelative = -1 } },
    
    -- Standard copy/paste bindings
    { key = "x", mods = "CTRL", action = "ActivateCopyMode" },
    { key = "v", mods = "CTRL|SHIFT", action = wezterm.action { PasteFrom = "Clipboard" } },
    { key = "c", mods = "CTRL|SHIFT", action = wezterm.action { CopyTo = "ClipboardAndPrimarySelection" } }
  }
}

    '';
  };
}
