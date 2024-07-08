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
    ../../programs/terminal/awscli
    ../../programs/terminal/nmpcpp
    # Desktop prgroams
    ../../programs/desktop/firefox
    ../../programs/desktop/slack
    ../../programs/desktop/pcmanfm
    ../../programs/desktop/libreoffice
    ../../programs/desktop/filezilla
    ../../programs/desktop/obsidian
  ];
}
