{ lib, buildVimPluginFrom2Nix, buildNeovimPluginFrom2Nix, fetchFromGitHub, fetchgit }:

final: prev:
{
    fine-cmdline-nvim = buildVimPluginFrom2Nix {
      pname = "fine-cmdline.nvim";
      version = "2022-07-01";
      src = fetchFromGitHub {
        owner = "VonHeikemen";
        repo = "fine-cmdline.nvim";
        rev = "ead2b85e455eacde10469a8fcf1a717822d2bb9a";
        sha256 = "1cx2bsn9lrcfafssd2bx0ldiaz7f76pda7y89rkqc69wcf15glwr";
      };
      meta.homepage = "https://github.com/VonHeikemen/fine-cmdline.nvim";
}
