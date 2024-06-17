{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./terminal
    ./services/kubernetes
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

