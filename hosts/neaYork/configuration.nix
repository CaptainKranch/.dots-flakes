#This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, lib, config, pkgs, home-manager, ... }: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    #./modules/nix-core.nix
    ./modules/nix-core.nix
    ./modules/system.nix
    ./modules/apps.nix
    ./modules/host-users.nix
    ./modules/nix-to-mac.nix

    # home manager
    home-manager.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      #home-manager.extraSpecialArgs = specialArgs;
      home-manager.users.dgm = import ./home;
    }
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
