{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = indent-blankline-nvim;
      type = "lua";
      config = /* lua */ ''
        require("ibl").setup()
      '';
    }
  ];
}
