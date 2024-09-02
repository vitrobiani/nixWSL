{ config, pkgs, userSettings, ... }:

{
	home.file = {
		".config/nvim" = {
			enable = true;
			source = ./cc-nvim;
			recursive = true;
		};
	};
}

