{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./terminal
    ./programs/firefox
    ./programs/nvim
    ./programs/discord
    ./programs/deluge
    ./programs/starship
    ./programs/slack
    ./programs/btop
    ./programs/pcmanfm
    ./programs/dbeaver
    ./programs/mariadb
    ./programs/filezilla
    ./programs/libreoffice
    ./programs/obsidian
    ./programs/lutris

  ];
}

