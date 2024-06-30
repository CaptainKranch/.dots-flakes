{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-autopairs;
      type = "lua";
      config = /* lua */ ''
        require('nvim-autopairs').setup{}
      '';
    }
  ];
}
