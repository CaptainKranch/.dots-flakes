{ pkgs }:
pkgs.writeShellScriptBin "wallpaper-set" ''
  
  wallpaper="/home/danielgm/.dots-flakes/wallpapers/vagabond.jpg"

  ${pkgs.feh}/bin/feh --bg-fill "$wallpaper"
''
