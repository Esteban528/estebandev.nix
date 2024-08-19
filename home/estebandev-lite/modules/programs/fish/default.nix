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
      alias cat bat


      set -U fish_greeting
    '';
   plugins = [
    ];
  };
}
