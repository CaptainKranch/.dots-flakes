{ pkgs, ... }:
{
  home.packages = with pkgs; [ 
    kubectl
    podman
    podman-desktop
    cri-o
    kubernetes
  ];
}
