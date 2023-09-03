{ pkgs, config, lib, ... }: {
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      vim-markdown
      vim-nix
      vim-toml
      pgsql-vim
      vim-jsx-typescript
      # Tree sitter
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = /* lua */ ''
          require('nvim-treesitter.configs').setup{
            highlight = {
              enable = true,
              additional_vim_regex_highlighting = false,
            },
          }
        '';
      }
    ];
  };
}
