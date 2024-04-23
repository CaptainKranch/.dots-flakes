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

        /* search */
        @media (-moz-bool-pref: "uc.tweak.popup-search") {
        #urlbar:is([breakout][breakout-extend]){
          #urlbar-input {
            font-size: 18px !important;
            text-align: left !important;
            padding-block: 12px !important;
            padding-inline: 6px !important;
          }
          
          position: fixed !important;
        /*  padding-top: 12px !important; */
        /*  --urlbar-height: auto !important; */
          margin-bottom: 25vh !important;
        /*  margin-top: 85vh !important; */
          background-color: #toolbar-bgcolor !important;
          
          left: 20vw !important;
          right: 20vw !important;
          width: 60vw !important;
        /*  padding-inline-start: 8px !important; */
        /*  padding-inline-end: 40vw !important; */
          --urlbar-width: auto !important;
          
          & .urlbarView-results {
            margin-top: 0px !important;
            padding-block-start: 0px !important;
          }

          
          /* background */
          &:before{
            content: "";
            position: fixed;
            pointer-events: none;
            
            width: 100vw;
            height: 100vh;
            
            top: 0px;
            left: 0px;
            
            background-color: #000000;
            opacity: 0.5;
            backdrop-filter: blur(300px);
          }
        }
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
