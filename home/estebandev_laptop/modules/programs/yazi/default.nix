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
        image = "feh";
        wallpaper = "swww img";
        pdf = "evince";
        tpdf = "tdf";
        video = "vlc";
        browser = "zen";
        default = "xdg-open";
      };
    };
  };
}
