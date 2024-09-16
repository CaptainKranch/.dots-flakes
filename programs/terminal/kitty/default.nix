{
  lib,
  pkgs,
  ...
}:
###########################################################
#
# Kitty Configuration
#
# Useful Hot Keys for macOS:
#   1. New Tab: `command + t`
#   2. Close Tab: `command + w`
#   3. Switch Tab: `shift + command + [` | `shift + command + ]`
#   4. Increase Font Size: `command + =` | `command + +`
#   5. Decrease Font Size: `command + -` | `command + _`
#   6. And Other common shortcuts such as Copy, Paste, Cursor Move, etc.
#   7. Search in the current window(show_scrollback): `ctrl + shift + h`
#          This will open a pager, it's defined by `scrollback_pager`, default is `less`
#        
#
# Useful Hot Keys for Linux:
#   1. New Tab: `ctrl + shift + t`
#   2. Close Tab: `ctrl + shift + q`
#   3. Switch Tab: `ctrl + shift + right` | `ctrl + shift + left`
#   4. Increase Font Size: `ctrl + shift + =` | `ctrl + shift + +`
#   5. Decrease Font Size: `ctrl + shift + -` | `ctrl + shift + _`
#   6. And Other common shortcuts such as Copy, Paste, Cursor Move, etc.
#
###########################################################
{
  programs.kitty = {
    enable = true;
    # kitty has catppuccin theme built-in,
    # all the built-in themes are packaged into an extra package named `kitty-themes`
    # and it's installed by home-manager if `theme` is specified.
    #theme = "Cyberpunk";
    theme = "Rosé Pine Dawn";
    font = {
      name = "JetBrainsMono Nerd Font";
      # use different font size on macOS
      size =
        if pkgs.stdenv.isDarwin
        then 14
        else 13;
    };

    keybindings = {
      "ctrl+shift+m" = "toggle_maximized";
    };

    settings =
      {
        #background_opacity = "1";
        # shell = " ${pkgs.nushell}/bin/nu ";
        macos_option_as_alt = true; # Option key acts as Alt on macOS
        scrollback_lines = 10000;
        enable_audio_bell = false;
        tab_bar_edge = "bot";     # tab bar on bop
        copy_on_select = true;
        allow_remote_control = true;
        term = "xterm-256color";
        enabled_layouts = "tall:bias=50;full_size=1;mirrored=false";

      };
  };
}
