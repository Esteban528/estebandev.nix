{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.kitty = {
    enable = true;
    font.name = lib.mkForce "FiraCode Nerd Font";
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = true;
      cursor_shape = "beam";
      url_style = "curly";
      font_size = lib.mkForce 10;
      cursor_underline_thickness = 7;
      mouse_hide_wait = "3.0";
      window_padding_width = 6;
      background_opacity = lib.mkForce "0.9799";
      # background_color = lib.mkForce "#${config.lib.stylix.colors.base0D}";
    };

    extraConfig = ''
      detect_urls yes
      repaint_delay 10
      input_delay 3
      sync_to_monitor yes

      # Keys
      map ctrl+left neighboring_window left
      map ctrl+right neighboring_window right
      map ctrl+up neighboring_window up
      map ctrl+down neighboring_window down

      map ctrl+shift+z toggle_layout_stack

      map F1 copy_to_buffer a
      map F2 paste_from_buffer a

      map ctrl+shift+enter new_window_with_cwd
      map ctrl+shift+t new_tab_with_cwd

      shell fish
    '';
  };
}
