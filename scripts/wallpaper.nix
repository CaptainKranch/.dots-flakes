{ pkgs }:
pkgs.writeShellScriptBin "wallpaper-set" ''
  
  # Directory containing your wallpapers
  wallpaper_dir="/home/danielgm/.dots-flakes/wallpapers"

  # Select a random wallpaper
  wallpaper=$(find "$wallpaper_dir" -type f | shuf -n 1)

  ${pkgs.pywal}/bin/wal -i "$wallpaper"

  # Apply the colorscheme to Kitty
  kitty @ set-colors --all ~/.cache/wal/colors-kitty.conf
  
  # Generate Nushell color configuration
  cat ~/.cache/wal/colors.sh | grep -E 'export COLOR_\d+' | sed 's/export /let /' | sed 's/=/: /' > ~/.cache/wal/colors.nu

  # Ensure the Nushell color configuration is sourced in config.nu
  if ! grep -q 'source ~/.cache/wal/colors.nu' ~/.config/nushell/config.nu; then
      echo 'source ~/.cache/wal/colors.nu' >> ~/.config/nushell/config.nu
  fi
  
''
