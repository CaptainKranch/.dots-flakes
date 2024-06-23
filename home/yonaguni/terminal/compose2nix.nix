{ pkgs, ... }: {
  home.packages = with pkgs; [ compose2nix ];
}
