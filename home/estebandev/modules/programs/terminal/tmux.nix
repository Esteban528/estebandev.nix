{...}:{
  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = '' 
      set -g pane-border-style "fg=color238 bg=#282C34" # i.e. "$onedark_black"
      set -g pane-active-border-style "fg=color14 bg=#282C34" # i.e. "$onedark_black"
      set -g status-left ""

      set -g status-position bottom
      set -g status-style "bg=black"
      set -g status-left '#[fg=color14,bold]#S '
      set -g status-right '  #[fg=color250] %Y-%m-%d #[fg=white,bold]%H:%M:%S'

      set -g status-right-length 50
      set -g status-left-length 20
    '';
  }
}
