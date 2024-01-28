{ pkgs, ... }:

let
  obsidian = pkgs.appimageTools.wrapType2 {
    name = "obsidian";
    src = pkgs.fetchurl {
      url = "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.3/Obsidian-1.5.3-arm64.AppImage";
      sha256 = "sha256-S68h4FM2+Npz4ihQR06GauMiX3PC1rNLaLq/DdmvL6g=";
    };
  };
in
{
  home.packages = with pkgs; [ obsidian ];
}

