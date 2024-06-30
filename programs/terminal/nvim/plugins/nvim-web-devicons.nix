{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-web-devicons;
      type = "lua";
      config = /* lua */ ''
        require('nvim-web-devicons').setup{}
      '';
    }
  ];
}
