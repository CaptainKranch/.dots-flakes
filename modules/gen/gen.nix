{ pkgs ? import <nixpkgs> { system = builtins.currentSystem; } 
, buildVimPlugin ? pkgs.buildGoModule
, fetchFromGitHub ? pkgs.fetchFromGitHub
}

buildVimPlugin rec {
  pname = "gen.nvim";
  version = "2023-10-23";
  src = fetchFromGitHub {
    owner = "David-Kunz";
    repo = "gen.nvim";
    rev = "b47c0ecab3a4270815afb3b05e03423b04cca8f2";
    sha256 = "1hkjc7x5ma8pmz5vi93ygqmbdfammikpvjjxkw9axlh5wh8ys48y";
  };
  meta.homepage = "https://github.com/David-Kunz/gen.nvim";
};
