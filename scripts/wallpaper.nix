{ pkgs }:
pkgs.writeShellScriptBin "wallpaper-set" ''
  
  # Directory containing your wallpapers
  wallpaper_dir="/home/danielgm/.dots-flakes/wallpapers"

  # Check for argument
  if [ "$1" = "light" ]; then
    wallpaper="$wallpaper_dir/topograpghy_white.webp "
  elif [ "$1" = "dark" ]; then
    wallpaper="$wallpaper_dir/emo-aesthetic-girl-red-desktop-wallpaper.jpg"
  else
    # Select a random wallpaper if no argument is provided
    wallpaper=$(find "$wallpaper_dir" -type f | shuf -n 1)
  fi

  ${pkgs.pywal}/bin/wal -i "$wallpaper"

  # Apply the colorscheme to Kitty
  kitty @ set-colors --all ~/.cache/wal/colors-kitty.conf

  # Ensure Kitty uses the new colorscheme for new instances
  kitty_conf="$HOME/.config/kitty/kitty.conf"
  temp_conf=$(mktemp)

  # Check if the include line already exists
  if ! grep -q "include ~/.cache/wal/colors-kitty.conf" "$kitty_conf"; then
    echo "include ~/.cache/wal/colors-kitty.conf" >> "$temp_conf"
  fi

  # Append the rest of the original kitty.conf
  cat "$kitty_conf" >> "$temp_conf"
  mv "$temp_conf" "$kitty_conf"
''
