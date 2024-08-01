{ pkgs, ... }:
{
  home.packages = with pkgs; [ joplin-desktop ];
}

