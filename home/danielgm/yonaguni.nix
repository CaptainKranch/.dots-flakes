{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./programs/firefox
    ./programs/inkdrop
    ./programs/nvim

  ];
}

