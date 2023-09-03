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

  ];
}

