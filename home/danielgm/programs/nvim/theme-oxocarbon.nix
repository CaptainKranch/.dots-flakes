
{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # oxocarbon-theme 
    {
      plugin = oxocarbon-nvim;
    }
  ];
}
