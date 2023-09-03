{ pkgs }:
pkgs.writeShellScriptBin "screen-lock" ''
  
  wallpaper="/home/danielgm/.dots-flakes/wallpapers/japna-street.jpg"

  ${pkgs.betterlockscreen}/bin/betterlockscreen -u "$wallpaper"
  ${pkgs.betterlockscreen}/bin/betterlockscreen -l
''
