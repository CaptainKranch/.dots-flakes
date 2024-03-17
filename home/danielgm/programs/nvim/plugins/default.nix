
{ config, pkgs, ... }:
{
  imports = [
    ./bufferline-nvim.nix
    ./vim-fugitive.nix
    ./gen.nix
    ./lsp.nix
    ./dadbod.nix
    ./lua-line.nix
    ./syntaxes.nix
    ./tree-lua.nix
    ./telescope.nix
    ./scope-nvim.nix
    ./nvim-notify.nix
    #./fine-cmd-line.nix
    ./gitsings-nvim.nix
    ./nvim-web-devicons.nix
    ./nvim-colorizer-lua.nix
    ./ident-blankline-nvim.nix
    ./noice.nix
    ./nvim-autopairs.nix
  ];
}
