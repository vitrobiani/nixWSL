{ config, pkgs, ... }:
{

  home.packages = (with pkgs; [
    gnomeExtensions.tilingnome
    gnomeExtensions.tiling-shell
    gnomeExtensions.paperwm
    gnomeExtensions.arcmenu
    gnomeExtensions.spotify-controls
    gnomeExtensions.blur-my-shell
    gnomeExtensions.forge
    gnomeExtensions.window-title-is-back
    gnomeExtensions.lilypad
    gnomeExtensions.hide-top-bar
    dconf-editor
    gnome-tweaks
  ]); 

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/shell" = {
        disable-user-extensions = false; # enables user extensions
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          spotify-controls.extensionUuid
          system-monitor.extensionUuid
          lilypad.extensionUuid
          hide-top-bar.extensionUuid
        ];
      };

      # Configure individual extensions
      "org/gnome/shell/extensions/blur-my-shell" = {
          "blacklist" = "@as []";
          "blur-on-overview" = false;
          "brightness" = "1.0";
          "customize" = true;
          "enable-all" = true;
          "opacity" = "0";
          "sigma" = "59";
          "blur" = true;
      };

    };
  };
}
