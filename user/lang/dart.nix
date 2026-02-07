
{ config, pkgs, ... }:

{

  
  # Set environment variables
  home.sessionVariables = {
    ANDROID_HOME = "${config.home.homeDirectory}/Android/Sdk";
    ANDROID_SDK_ROOT = "${config.home.homeDirectory}/Android/Sdk";
    CHROME_EXECUTABLE = "${pkgs.chromium}/bin/chromium";
  };

  # Flutter and Android development
  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };
  
  home.packages = with pkgs;[
    flutter
    # androidenv.androidPkgs.all.packages.cmdline-tools.v19_0
    android-tools
    jdk17
  ];
}
