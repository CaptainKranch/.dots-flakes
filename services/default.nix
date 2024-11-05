{ inputs, outputs, ... }: {
  imports = [
    ./immich.nix
    ./arr.nix
    ./lobe-chat.nix
    #./docmost.nix
    #./joplin.nix
    #./analytics.nix
  ];
}

