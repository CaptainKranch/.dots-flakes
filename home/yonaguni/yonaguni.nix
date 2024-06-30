{ inputs, outputs, ... }: {
  imports = [
    ./global
    # Terminal programs
    ../../programs/terminal/kitty
    ../../programs/terminal/nushell
    ../../programs/terminal/lazygit
    ../../programs/terminal/wormhole
    ../../programs/terminal/unzip
    ../../programs/terminal/nvim
    ../../programs/terminal/btop
    ../../programs/terminal/starship
    # Desktop prgroams
    ../../programs/firefox
    ../../programs/slack
    ../../programs/pcmanfm
    ../../programs/libreoffice
    ../../programs/obsidian
    ../../programs/zoom

  ];
}

