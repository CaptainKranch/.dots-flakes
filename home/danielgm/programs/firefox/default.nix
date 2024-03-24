{ config, pkgs, inputs, ... }:

{
  programs.browserpass.enable = true;
  programs.firefox = {
    enable = true;
    profiles.CaptainKranch = {
      bookmarks = { };
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        darkreader
      ];
      userChrome = ''
        #appcontent
          > #tabbrowser-tabbox
          > #tabbrowser-tabpanels
          > .deck-selected
          > .browserContainer
          > .browserStack
          > browser {
            border-radius: 10px !important;
            margin: 10px !important;
          }

        .browserStack {
            background: #1E1E24;
        }

        .browserContainer {
          background-color: var(
            --lwt-accent-color-inactive,
            var(--lwt-accent-color)
          ) !important;
          background-image: var(--lwt-header-image), var(--lwt-additional-images) !important;
          background-repeat: no-repeat, var(--lwt-background-tiling) !important;
          background-position: right top, var(--lwt-background-alignment) !important;
        }

        #titlebar {
          display: none !important;
        }

        .titlebar-buttonbox-container {
          display: none !important;
        }

        #sidebar-button {
          margin-left: 10px !important;
        }

        #nav-bar {
          background-color: #000501 !important;
        }

        #urlbar-background {
          background-color: #000501 !important;
        }

        #navigator-toolbox:not(:hover) {
          --is-bar-visible: hidden;
          opacity: 0 !important;
          height: 15px;
          transition: height 200ms ease-in-out, opacity 175ms ease-in-out;
        }

        #navigator-toolbox {
          position: fixed;
          z-index: 1;
          height: 60px;
          overflow: var(--is-bar-visible);
          left: 0;
          right: 0;
          top: 0;
          background-color: transparent !important;
        }

        #navigator-toolbox:hover {
          height: 40px;
          opacity: 1 !important;
          transition: opacity 175ms ease-in-out;
        }

        #navigator-toolbox:focus-within {
          height: 40px;
          opacity: 1 !important;
          transition: opacity 175ms ease-in-out;
          --is-bar-visible: visible;
        }

      '';
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}
