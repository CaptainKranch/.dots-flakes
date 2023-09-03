{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # lualine
    {
      plugin = lualine-nvim;
      type = "lua";
      config = /* lua */ ''
      require('lualine').setup{
        options = {
          theme = "tokyonight",
        }
      }
      '';
    }
  ];
}
