# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    #inputs.nix-colors.homeManagerModule
    #inkdrop = pkgs.callPackage ../programs/inkdrop{ };

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
    };
  };

  # TODO: Set your username
  home = {
    username = "danielgm";
    homeDirectory = "/home/danielgm";
  };

  # Add stuff for your user as you see fit:
  programs.neovim.enable = true;
  home.packages = with pkgs; [ spotify ];

  # Enable home-manager and git
  programs.home-manager.enable = true;

  #GIT
  programs.git = {
    enable = true;
    userName = "danielgm";
    userEmail = "daniel.garcia@ezlo.com";
  };

  #Themes
#  gtk = { 
#    enanble = true;
#    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
#    font = {
#      name = "Roboto";
#      package = pkgs.roboto;
#    };
#
#    cursorTheme = {
#      name = "apple_cursor";
#      package = pkgs.apple_cursor;
#    };
#
#    iconTheme = {
#      name = "Papirus-theme";
#      package = pkgs.papirus-icon-theme;
#    };
#
#    theme = {
#      name = "Catppuccin-Macchiato-Compact-Pink-dark";
#      package = pkgs.catppuccin-gtk.override {
#        # https://github.com/NixOS/nixpkgs/blob/nixos-23.05/pkgs/data/themes/catppuccin-gtk/default.nix
#        accents = [ "pink" ];
#        size = "compact";
#        variant = "mocha";
#      };
#    };
#  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
