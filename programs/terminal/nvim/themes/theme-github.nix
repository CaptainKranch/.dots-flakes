{ inputs, pkgs, ... }: {
  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          github-nvim-theme = prev.vimUtils.buildVimPlugin {
            name = "github-nvim-theme";
            src = inputs.plugin-github-theme;
          };
        };
      })
    ];
  };
