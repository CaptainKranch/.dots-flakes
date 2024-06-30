{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-notify;
      type = "lua";
      config = ''
        vim.opt.termguicolors = true
        vim.notify = require("notify")
      '';
    }
  ];
}
