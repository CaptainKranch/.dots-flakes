{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./terminal
    #./services/podman/nginx
    #./services/immich
    ./programs/firefox
    ./programs/nvim
    ./programs/starship
    ./programs/slack
    ./programs/btop
    ./programs/pcmanfm
    ./programs/libreoffice
    ./programs/obsidian

  ];
}

