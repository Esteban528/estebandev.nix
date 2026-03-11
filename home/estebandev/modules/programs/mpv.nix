{pkgs, ...} : {

programs.mpv = {
  enable = true;

  scripts = with pkgs.mpvScripts; [
    uosc
    sponsorblock
  ];

  config = {
    profile = "high-quality";
    ytdl-format = "bestvideo+bestaudio";
    cache-default = 4000000;
  };
};
}
