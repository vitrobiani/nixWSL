
{ pkgs, ... }:

{
  home.packages = with pkgs;[
    nodejs_22
    ast-grep
  ];

  # home.file.".clang-format".text = "
  # BasedOnStyle: LLVM
  # IndentWidth: 4";

}
