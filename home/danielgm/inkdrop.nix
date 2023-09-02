{ pkgs ? import <nixpkgs> { } }: rec {

  # Packages with an actual source
  inkdrop = pkgs.callPackage ./inkdrop{ };
}
