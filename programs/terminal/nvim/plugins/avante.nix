
{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = avante-nvim;
    }
    {
      plugin = avante-nvim;
      type = "lua";
      config = ''
        require('avante_lib').load()
        require('avante').setup ({
          -- Your config here!
        })
      '';
    }
  ];
}
