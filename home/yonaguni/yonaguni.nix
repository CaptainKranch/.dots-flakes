{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./terminal
    ./programs/firefox
    ./programs/nvim
    ./programs/starship
    ./programs/slack
    ./programs/btop
    ./programs/pcmanfm
    ./programs/libreoffice
    ./programs/obsidian

  ];
}

