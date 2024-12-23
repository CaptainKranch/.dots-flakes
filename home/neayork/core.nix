{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utils
    nmap # A utility for network discovery and security auditing

    # misc
    cowsay
    tree
    zstd
    caddy

    # productivity
    glow # markdown previewer in terminal
    kitty
    lazygit
    aerospace

    # Builds
    go
    cargo
    poetry
    uv
  ];

  programs = {
    # modern vim
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };

    # terminal file manager
    yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        manager = {
          show_hidden = true;
          sort_dir_first = true;
        };
      };
    };
  };
}
