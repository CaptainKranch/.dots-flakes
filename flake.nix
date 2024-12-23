{
  description = "My personal NixOS configuration using Flakes";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # MacOS
    #nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    #nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #nvim-plugins
    plugin-gen-nvim = {
      url = "github:CaptainKranch/gen-docker.nvim";
      flake = false;
    };

    plugin-fine-cmd-line-nvim = {
      url = "github:VonHeikemen/fine-cmdline.nvim";
      flake = false;
    };
    
    plugin-github-nvim-theme = {
      url = "github:projekt0n/github-nvim-theme";
      flake = false;
    };

    #Firefox addons
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, darwin, ... }@inputs: 
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [ "x86_64-linux" "aarch64-darwin" ];
      forEachSystem = f: lib.genAttre systems (sys: f pkgsFor.${sys});
      pkgsFor = nixpkgs.legacyPackages;
      username = "dgm";
      specialArgs =
        inputs
        // {
          inherit username;
        };
    in
    {
      inherit lib;
      # NixOS configuration entrypoint
      # Available through 'sudo nixos-rebuild switch --flake .#your-hostname'
      nixosConfigurations = {
        # Main Desktop
        yonaguni = lib.nixosSystem {
          specialArgs = { inherit inputs; }; # Pass flake inputs to our config
          # > Our main nixos configuration file <
          modules = [ ./hosts/yonaguni/configuration.nix ];
        };
        # Testing Kubernetes server
        medellin = lib.nixosSystem {
          specialArgs = { inherit inputs; }; # Pass flake inputs to our config
          # > Our main nixos configuration file <
          modules = [ ./hosts/medellin/configuration.nix ];
        };
        iso = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; }; # Pass flake inputs to our config
          modules = [ ./hosts/medellin/configuration.nix ];
        };
      };

      # Nix-Darwin configuration entrypoint
      # Available through 'darwin-rebuild switch --flake .#your-hostname'
      darwinConfigurations = {
        # FIXME replace with your username@hostname
        # Main Workstation(Mac-mini aarch64-darwin)
        neayork = darwin.lib.darwinSystem {
          specialArgs = { inherit inputs; }; # Pass flake inputs to our config
          modules = [
            ./modules/arm-darwin/nix-core.nix
            ./modules/arm-darwin/system.nix
            ./modules/arm-darwin/apps.nix
            ./modules/arm-darwin/host-users.nix
            ./modules/arm-darwin/nix-to-mac.nix

            # home manager
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.users.${username} = import ./home/neaYork;
            }
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager switch --flake .#your-username@your-hostname'
      homeConfigurations = {
        # FIXME replace with your username@hostname
        "captainkranch@yonaguni" = lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; }; # Pass flake inputs to our config
          # > Our main home-manager configuration file <
          modules = [ ./home/yonaguni/yonaguni.nix ];
        };
        "captainkranch@medellin" = lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; }; # Pass flake inputs to our config
          # > Our main home-manager configuration file <
          modules = [ ./home/medellin/medellin.nix ];
        };
      };
    };
}
