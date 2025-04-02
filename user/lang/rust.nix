
{ pkgs, ... }:

{
  home.packages = with pkgs;[
    rustfmt
    rust-analyzer
    rustc
    cargo
    cargo-cross
    udev alsa-lib vulkan-loader
    xorg.libX11 xorg.libXcursor xorg.libXi xorg.libXrandr # To use the x11 feature
    libxkbcommon wayland # To use the wayland feature
    mesa pkg-config
    x11basic
    alsa-lib
    alsa-tools
    xorg.xbitmaps
    libxkbcommon
  ];


}
