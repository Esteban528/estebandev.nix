{pkgs, ...}: {
  home.packages = with pkgs; [
    dunst
  ];

  services.dunst = {
    enable = true;
    settings = {
      global = {
        timeout = 2;
        title = "Dunst";
        class = "Dunst";
        monitor = 0;
        follow = "mouse";
        width = 300;
        height = 400;
        origin = "top-right";
        offset = "20x20";
        indicate_hidden = true;
        shrink = true;

        transparency = 5;
        separator_height = 3;
        padding = 8;
        horizontal_padding = 11;
        frame_width = 2;

        line_height = 0;
        markup = "full";
        format = "<span size='x-large' weight='bold'>%s</span>\n%b";
        alignment = "center";

        idle_threshold = 120;
        show_age_threshold = 60;
        sort = "no";
        word_wrap = true;
        ignore_newline = false;
        stack_duplicates = false;
        hide_duplicate_count = true;
        show_indicators = false;
        sticky_history = false;
        history_length = 20;
        always_run_script = true;
        corner_radius = 8;
        icon_position = "left";
        max_icon_size = 80;

        mouse_left_click = "do_action";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
      };
    };
  };
}
