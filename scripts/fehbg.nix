{ pkgs }:
pkgs.writeShellScriptBin "wallpaper-set" ''
  
wallpaper="/home/danielgm/.dots-flakes/wallpapers/yes.webp"

  ${pkgs.feh}/bin/feh --bg-fill "$wallpaper"
''
