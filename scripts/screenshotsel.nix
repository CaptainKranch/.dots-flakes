{ pkgs }:
pkgs.writeShellScriptBin "screenshot-sel" ''
  
  directory="/home/danielgm/Pictures/screenshots/"
  file_name="$(date +'%m-%d-%Y-%H%M%S.png')"

  ${pkgs.scrot}/bin/scrot "$directory$file_name" --select --line mode=edge
  ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png -i "$directory$file_name"
''
