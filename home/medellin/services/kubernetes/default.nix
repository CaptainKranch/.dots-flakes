{ pkgs, ... }:
{
  home.packages = with pkgs; [ 
    dive
    kubectl
    podman
    podman-tui
    podman-compose
    podman-desktop
    cri-o
    kubernetes
    conntrack-tools
    ethtool
    socat
  ];
}
