{...} : {
  programs.yazi = {
    enable = true;
    settings = {
      manager = {
        ratio = [ 1 4 3 ];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = false;
        show_symlink = true;
      };

      open = {
        edit = "nvim";
        image = "imv";
        wallpaper = "swww img";
        pdf = "evince";
        tpdf = "okular";
        video = "vlc";
        browser = "zen";
        default = "xdg-open";
      };
    };
  };
}
