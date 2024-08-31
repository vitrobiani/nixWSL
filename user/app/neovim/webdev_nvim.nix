{ config, pkgs, userSettings, ... }:

{
	home.file = {
		".config/nvim" = {
			enable = true;
			source = ./webdev_nvim;
			recursive = true;
		};
	};
}

