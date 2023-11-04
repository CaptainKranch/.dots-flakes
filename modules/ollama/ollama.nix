{ pkgs ? import <nixpkgs> { system = builtins.currentSystem; } 
, lib ? pkgs.lib
, buildGoModule ? pkgs.buildGoModule
, fetchFromGitHub ? pkgs.fetchFromGitHub
, stdenv ? pkgs.stdenv
, darwin ? pkgs.darwin
}:

buildGoModule rec {
  pname = "ollama";
  version = "0.1.7";

  src = fetchFromGitHub {
    owner = "jmorganca";
    repo = "ollama";
    rev = "v${version}";
    hash = "sha256-rzcuRU2qcYTMo/GxiSHwJYnvA9samfWlztMEhOGzbRg=";
  };

  buildInputs = lib.optionals stdenv.isDarwin (with darwin.apple_sdk_11_0.frameworks; [
    Accelerate
    MetalPerformanceShaders
    MetalKit
  ]);

  vendorHash = "sha256-Qt5QVqRkwK61BJPVhFWtox6b9E8BpAIseNB0yhh+/90=";

  ldflags = [ "-s" "-w" ];

  meta = with lib; {
    description = "Get up and running with large language models locally";
    homepage = "https://github.com/jmorganca/ollama";
    license = licenses.mit;
    maintainers = with maintainers; [ dit7ya ];
  };
}
