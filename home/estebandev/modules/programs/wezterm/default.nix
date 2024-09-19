{...}:{
  wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require("wezterm")

      local function font_with_fallback(name, params)
        local names = { name, "Apple Color Emoji", "azuki_font" }
        return wezterm.font_with_fallback(names, params)
      end

      local font_name = "JetBrains Mono NerdFont"

      return {
        -- Default shell
        default_prog = { "/run/current-system/sw/bin/fish" },
        -- OpenGL for GPU acceleration, Software for CPU
        front_end = "WebGpu",
        enable_wayland = false,

        -- Font config
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
        warn_about_missing_glyphs = false,
        font_size = 11,
        line_height = 1.0,

        -- Cursor style
        default_cursor_style = "BlinkingUnderline",

        -- Keybinds
        disable_default_key_bindings = true,
        keys = {
          {
            key = [[\\]],
            mods = "CTRL|ALT",
            action = wezterm.action({
              SplitHorizontal = { domain = "CurrentPaneDomain" },
            }),
          },
          {
            key = [[\\]],
            mods = "CTRL",
            action = wezterm.action({
              SplitVertical = { domain = "CurrentPaneDomain" },
            }),
          },
          {
            key = "q",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
          },
          {
            key = "h",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ ActivatePaneDirection = "Left" }),
          },
          {
            key = "l",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ ActivatePaneDirection = "Right" }),
          },
          {
            key = "k",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ ActivatePaneDirection = "Up" }),
          },
          {
            key = "j",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ ActivatePaneDirection = "Down" }),
          },
          {
            key = "h",
            mods = "CTRL|SHIFT|ALT",
            action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
          },
          {
            key = "l",
            mods = "CTRL|SHIFT|ALT",
            action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
          },
          {
            key = "k",
            mods = "CTRL|SHIFT|ALT",
            action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
          },
          {
            key = "j",
            mods = "CTRL|SHIFT|ALT",
            action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
          },
          { -- browser-like bindings for tabbing
            key = "t",
            mods = "CTRL",
            action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
          },
          {
            key = "w",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
          },
          {
            key = "Tab",
            mods = "CTRL",
            action = wezterm.action({ ActivateTabRelative = 1 }),
          },
          {
            key = "Tab",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ ActivateTabRelative = -1 }),
          }, -- standard copy/paste bindings
          {
            key = "x",
            mods = "CTRL",
            action = "ActivateCopyMode",
          },
          {
            key = "v",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ PasteFrom = "Clipboard" }),
          },
          {
            key = "c",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
          },
        },

        -- Padding
        window_padding = {
          left = 5,
          right = 5,
          top = 5,
          bottom = 5,
        },

        -- Tab Bar
        enable_tab_bar = true,
        hide_tab_bar_if_only_one_tab = true,
        show_tab_index_in_tab_bar = false,

        -- General
        automatically_reload_config = true,
        inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
        window_background_opacity = 0.94,
        window_close_confirmation = "NeverPrompt",
      }
    '';
  };
}
