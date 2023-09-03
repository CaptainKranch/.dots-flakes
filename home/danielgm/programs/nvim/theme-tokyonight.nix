
{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # telescope-nvim
    {
      plugin = tokyonight-nvim;
      type = "lua";
      config = /* lua */ ''
      '';
    }
  ];
}
