{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./terminal
    ./programs/firefox
    ./programs/nvim
    ./programs/starship
    ./programs/slack
    ./programs/btop
    ./programs/mupdf
    ./programs/dbeaver
    ./programs/mariadb
    ./programs/lollypop
    ./programs/pcmanfm
    ./programs/ncmpcpp
    ./programs/libreoffice
    ./programs/filezilla
    ./programs/appflowy
  ];
}
