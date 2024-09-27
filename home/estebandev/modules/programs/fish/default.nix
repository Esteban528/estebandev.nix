{pkgs, ...}: {
  home.packages = with pkgs; [
    fish
    fzf
    grc
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source

      alias ll 'lsd -lh --group-dirs=first'
      alias la 'lsd -a --group-dirs=first'
      alias l 'lsd --group-dirs=first'
      alias lla 'lsd -lha --group-dirs=first'
      alias ls 'lsd --group-dirs=first'
      #alias cat bat


      set -U fish_greeting

      set -U fish_color_normal normal
      set -U fish_color_command FF9400
      set -U fish_color_quote BF9C30
      set -U fish_color_redirection BF5B30
      set -U fish_color_end FF4C00
      set -U fish_color_error FFDD73
      set -U fish_color_param FFC000
      set -U fish_color_comment A63100
      set -U fish_color_match --background=brblue
      set -U fish_color_selection white --bold --background=brblack
      set -U fish_color_search_match bryellow --background=brblack
      set -U fish_color_history_current --bold
      set -U fish_color_operator 00a6b2
      set -U fish_color_escape 00a6b2
      set -U fish_color_cwd green
      set -U fish_color_cwd_root red
      set -U fish_color_valid_path --underline
      set -U fish_color_autosuggestion FFC473
      set -U fish_color_user brgreen
      set -U fish_color_host normal
      set -U fish_color_cancel --reverse
      set -U fish_pager_color_prefix normal --bold --underline
      set -U fish_pager_color_progress brwhite --background=cyan
      set -U fish_pager_color_completion normal
      set -U fish_pager_color_description B3A06D
      set -U fish_pager_color_selected_background --background=brblack
      set -U fish_color_host_remote
      set -U fish_pager_color_secondary_background
      set -U fish_pager_color_secondary_completion
      set -U fish_color_keyword
      set -U fish_pager_color_secondary_description
      set -U fish_pager_color_selected_description
      set -U fish_pager_color_secondary_prefix
      set -U fish_color_option
      set -U fish_pager_color_selected_completion
      set -U fish_pager_color_background
      set -U fish_pager_color_selected_prefix
    '';
    plugins = [
    ];
  };
}
