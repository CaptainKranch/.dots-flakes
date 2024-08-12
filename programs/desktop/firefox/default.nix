{ config, pkgs, inputs, ... }:

{
  programs.browserpass.enable = true;
  programs.firefox = {
    enable = true;
    profiles.CaptainKranch = {
      bookmarks = { };
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        darkreader
        youtube-shorts-block
        gesturefy
      ];
     };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}
