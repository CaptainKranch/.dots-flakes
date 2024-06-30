{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./terminal
    ../../programs/firefox
    ../../programs/nvim
    ../../programs/starship
    ../../programs/slack
    ../../programs/btop
    ../../programs/dbeaver
    ../../programs/mariadb
    ../../programs/pcmanfm
    ../../programs/libreoffice
    ../../programs/filezilla
    ../../programs/obsidian
  ];
}
