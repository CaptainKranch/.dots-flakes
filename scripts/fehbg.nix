{ pkgs }:
pkgs.writeShellScriptBin "wallpaper-set" ''
  wallpaper="$1"
  
  if [ -z "$wallpaper" ]; then
    # Default wallpaper if no argument is provided
    wallpaper="/home/danielgm/.dots-flakes/wallpapers/f1_rain.jpg"
  fi

  ${pkgs.pywal}/bin/wal -i "$wallpaper"
  
''
