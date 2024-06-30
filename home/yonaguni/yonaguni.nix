{ inputs, outputs, ... }: {
  imports = [
    ./global
    # Terminal programs
    ../../programs/terminal/kitty
    ../../programs/terminal/nushell
    ../../programs/terminal/lazygit
    ../../programs/terminal/wormhole
    ../../programs/terminal/unzip
    # Desktop prgroams
    ../../programs/firefox
    ../../programs/nvim
    ../../programs/starship
    ../../programs/slack
    ../../programs/btop
    ../../programs/pcmanfm
    ../../programs/libreoffice
    ../../programs/obsidian
    ../../programs/zoom

  ];
}

