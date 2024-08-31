
{ pkgs, ... }:

{
  home.packages = with pkgs;[
    clang-tools
    lldb_18
    vimPlugins.nvim-nio
    cmake-language-server
    gdb
    gcc
    cmake
    gnumake42
  ];

  home.file.".clang-format".text = "
  BasedOnStyle: LLVM
  IndentWidth: 4";

}
