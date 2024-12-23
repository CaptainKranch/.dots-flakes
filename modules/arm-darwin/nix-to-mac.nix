{ config, lib, pkgs, ... }:

{
  options.myModule = {
    enable = lib.mkEnableOption "Enable application symlinks to /Applications/Nix Apps";
  };

  config = lib.mkIf config.myModule.enable {
    system.activationScripts.applications = let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";  # This ensures paths like /Applications/Foo.app exist in the build env
      };
      nixAppsDir = "/Applications/Nix Apps";
    in
      pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read -r src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
      '';
  };
}
