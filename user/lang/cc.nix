
{ pkgs, ... }:

{

  home.file ={
    "Makefiles" = {
      enable = true;
      source = ../../user/lang/Makefiles;
      recursive = true;
    };

    ".clang-format".text = "
      BasedOnStyle: LLVM
      IndentWidth: 4";
  };

  home.packages = with pkgs;[
    clang-tools
    lldb_18
    vimPlugins.nvim-nio
    cmake-language-server
    gdb
    gcc
    cmake
    gnumake42
    valgrind
    freeglut
    mesa
    nemiver
    libgcc
  ];

}
