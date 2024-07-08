{ inputs, pkgs, ... }: {
  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          github-nvim-theme = prev.vimUtils.buildVimPlugin {
            name = "github-nvim-theme";
            src = inputs.plugin-github-nvim-theme;
          };
        };
      })
    ];
  };
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = github-nvim-theme;
      type = "lua";
      config = ''
        vim.cmd("colorscheme github_light")
      '';
    }
  ];
}

