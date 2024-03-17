{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = neogit;
      type = "lua";
      config = /* lua */ ''
        require("neogit").setup({
          neogit.setup {}
        })
      '';
    }
  ];
}
