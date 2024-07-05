{ pkgs, ... }:
{
  home.packages = [ pkgs.mopidy pkgs.mopidy-jellyfin ];
}
