
{ pkgs, ... }:

{
  home.packages = with pkgs;[
    rustfmt
    rust-analyzer
    rustc
    cargo
    cargo-cross
  ];


}
