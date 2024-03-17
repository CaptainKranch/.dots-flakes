{ pkgs }:
pkgs.writeShellScriptBin "wallpaper-set" ''
  wallpaper="$1"
  
  if [ -z "$wallpaper" ]; then
    # Default wallpaper if no argument is provided
    wallpaper="/home/danielgm/.dots-flakes/wallpapers/yes.webp"
  fi

  ${pkgs.feh}/bin/feh --bg-fill "$wallpaper"
''
