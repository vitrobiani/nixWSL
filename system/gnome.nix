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
    gnomeExtensions.pano
    gnomeExtensions.unite
    gnomeExtensions.battery-health-charging
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.gsconnect
    gnomeExtensions.valent
    gnomeExtensions.custom-hot-corners-extended
    gnomeExtensions.vertical-workspaces
    polkit
    dconf-editor
    gnome-tweaks
  ]); 

  dconf = {
    enable = true;
    settings = {
      # "org/gnome/desktop/interface".color-scheme = "prefer-dark";
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          gtk-theme = "Adwaita-dark";
          clock-show-weekday = true;
        };

        "org/gnome/desktop/wm/preferences" = {
          button-layout = "appmenu:minimize,maximize,close";
        };

      "org/gnome/shell" = {
        disable-user-extensions = false; # enables user extensions
        disable-extension-version-validation = true;  # Add this line
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          spotify-controls.extensionUuid
          system-monitor.extensionUuid
          lilypad.extensionUuid
          hide-top-bar.extensionUuid
          battery-health-charging.extensionUuid
          clipboard-indicator.extensionUuid
          gsconnect.extensionUuid
          valent.extensionUuid
          #custom-hot-corners-extended.extensionUuid
          #vertical-workspaces.extensionUuid
          arcmenu.extensionUuid
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
