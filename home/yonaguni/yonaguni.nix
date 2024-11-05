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
    ../../programs/terminal/ncmpcpp
    # Desktop prgroams
    ../../programs/desktop/firefox
    ../../programs/desktop/slack
    ../../programs/desktop/pcmanfm
    ../../programs/desktop/libreoffice
    ../../programs/desktop/obsidian
    ../../programs/desktop/moonlight
    ../../programs/desktop/discord
    ../../programs/desktop/thunderbird
    ../../programs/desktop/chromium
    ../../programs/desktop/teams
    ../../programs/desktop/zoom

  ];
}

