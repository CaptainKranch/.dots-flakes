{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./terminal
    ./programs/firefox
#    ./programs/inkdrop
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
    ./programs/mupdf
    ./programs/lollypop
  ];
}

