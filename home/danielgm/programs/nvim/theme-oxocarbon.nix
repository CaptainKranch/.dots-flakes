
{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # oxocarbon-theme 
    {
      plugin = oxocarbon-nvim;
      type = "lua";
      config = /* lua */ ''
        vim.opt.background = "dark" -- set this to dark or light
        vim.cmd("colorscheme oxocarbon")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      '';
    }
  ];
}
