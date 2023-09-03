{ pkgs }:
pkgs.writeShellScriptBin "wallpaper-set" ''
  
  wallpaper="/home/danielgm/.dots-flakes/wallpapers/coclors.png"

  ${pkgs.feh}/bin/feh --bg-fill "$wallpaper"
''
