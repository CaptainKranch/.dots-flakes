# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    #inputs.nix-colors.homeManagerModule
    ./alsa-utils.nix
    ./xclip.nix
    ./dconf.nix
    ./gtk.nix
    ./qt.nix
    ./keyring.nix

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
      #Obsidian
      permittedInsecurePackages = [
        "electron-29.4.6"
      ];
    };
  };

  # TODO: Set your username
  home = {
    username = "danielgm";
    homeDirectory = "/home/danielgm";
  };

  # Add stuff for your user as you see fit:
  programs.neovim.enable = true;
  home.packages = with pkgs; [ apple-cursor ];
  home.pointerCursor = {
    package = pkgs.apple-cursor;
    name = "macOS-BigSur";
    size = 23;
    gtk.enable = true;
  };
  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };

    bash.enable = true;
    nushell.enable = true;
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;

  #GIT
  programs.git = {
    enable = true;
    userName = "Daniel García M";
    userEmail = "dgarcia1.c@aes.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
