{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # UI
    {
      plugin = vim-fugitive;
      type = "viml";
      config = /* vim */ ''
        nmap <space>G :Git<CR>
      '';
    }
    {
      plugin = bufferline-nvim;
      type = "lua";
      config = /* lua */ ''
        require('bufferline').setup{}
      '';
    }
    {
      plugin = scope-nvim;
      type = "lua";
      config = /* lua */ ''
        require('scope').setup{}
      '';
    }
    {
      plugin = indent-blankline-nvim;
      type = "lua";
      config = /* lua */ ''
        require("ibl").setup()
      '';
    }
    {
      plugin = nvim-web-devicons;
      type = "lua";
      config = /* lua */ ''
        require('nvim-web-devicons').setup{}
      '';
    }
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = /* lua */ ''
        require('gitsigns').setup{
          signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
          },
        }
      '';
    }
    {
      plugin = nvim-colorizer-lua;
      type = "lua";
      config = /* lua */ ''
        require('colorizer').setup{}
      '';
    }
  ];
}
