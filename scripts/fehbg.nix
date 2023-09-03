
wallpaper="/home/danielgm/.dots-flakes/wallpapers/coclors.png"

# Set the wallpaper using feh
feh --bg-fill "$wallpaper"
{ pkgs }:
pkgs.writeShellScriptBin "wallpaper-set" ''
  
  directory="/home/danielgm/.dots-flakes/wallpapers/coclors.png"

  ${pkgs.feh}/bin/feh "$directory$file_name" --select --line mode=edge
''
