{ pkgs ? import <nixpkgs> { system = builtins.currentSystem; } 
, stdenv ? pkgs.stdenv
, lib ? pkgs.lib
, libxkbcommon ? pkgs.libxkbcommon
, libdrm ? pkgs.libdrm
, alsaLib ? pkgs.alsaLib
, atk ? pkgs.atk
, at-spi2-atk ? pkgs.at-spi2-atk
, cairo ? pkgs.cairo
, cups ? pkgs.cups
, dbus ? pkgs.dbus
, dpkg ? pkgs.dpkg
, expat ? pkgs.expat
, fontconfig ? pkgs.fontconfig
, freetype ? pkgs.freetype
, fetchurl ? pkgs.fetchurl
, gdk-pixbuf ? pkgs.gdk-pixbuf
, glib ? pkgs.glib
, gtk2 ? pkgs.gtk2
, gtk3 ? pkgs.gtk3
, libpulseaudio ? pkgs.libpulseaudio
, makeWrapper ? pkgs.makeWrapper
, nspr ? pkgs.nspr
, nss ? pkgs.nss
, pango ? pkgs.pango
, udev ? pkgs.udev
, xorg ? pkgs.xorg
, libuuid ? pkgs.libuuid
, at-spi2-core ? pkgs.at-spi2-core
, libsecret ? pkgs.libsecret
, coreutils ? pkgs.coreutils
, mesa ? pkgs.mesa
, gnome ? pkgs.gnome
, gsettings ? pkgs.settings-desktop-schemas
}:

let
  version = "5.5.3";

  deps = [
    libxkbcommon
    libuuid
    libdrm
    libsecret
    alsaLib
    atk
    at-spi2-atk
    at-spi2-core
    cairo
    cups
    dbus
    expat
    fontconfig
    freetype
    gdk-pixbuf
    glib
    gtk2
    gtk3
    libpulseaudio
    nspr
    nss
    pango
    stdenv.cc.cc
    udev
    xorg.libX11
    xorg.libxcb
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXScrnSaver
    xorg.libXtst
    xorg.libxkbfile
    xorg.libxshmfence
    mesa
    gnome.gnome-keyring
    gsettings
  ];

in

stdenv.mkDerivation {
  pname = "inkdrop";
  inherit version;
  allowUnfree = true;

  src = fetchurl {
    url = "https://d3ip0rje8grhnl.cloudfront.net/v${version}/inkdrop_${version}_amd64.deb";
    hash = "sha256-HWaMNBJrMUbVlPZmpw224irYFM2/6owZrBUlAL23Z0E=";
  };

  dontBuild = true;
  buildInputs = [ dpkg makeWrapper ];

  unpackPhase = ''
    dpkg --fsys-tarfile $src | tar --extract
  '';

  installPhase = ''
    rm -r ./usr/share/lintian
    rm -r ./usr/share/doc

    mkdir -p $out
    cp -r ./usr/share $out
    cp -r ./usr/bin $out
    cp -r ./usr/lib $out

    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
             "$out/lib/inkdrop/inkdrop"

    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
             "$out/lib/inkdrop/resources/app/ipm/bin/node"

    wrapProgram $out/lib/inkdrop/inkdrop \
      --prefix LD_LIBRARY_PATH : "$out/lib/inkdrop" \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath deps}"

    wrapProgram $out/lib/inkdrop/resources/app/ipm/bin/ipm \
      --prefix PATH : "${coreutils.out}/bin" \
      --prefix LD_LIBRARY_PATH : "$out/lib/inkdrop" \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath deps}"
  '';

  meta = with lib; {
    homepage = "https://www.inkdrop.app/";
    description = "Organizing your Markdown notes made simple";
    license = licenses.unfreeRedistributable;
    platforms = [ "x86_64-linux" ];
    maintainers = [ maintainers.danielgm ];
  };
}

