
{ inputs, outputs, ... }: {
  imports = [
    ./terminal
    ./services/kubernetes
    ./programs/nvim
    ./programs/starship
    ./programs/btop
  ];
}

