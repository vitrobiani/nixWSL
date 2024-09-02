{ config, pkgs, userSettings, ... }:

{
	home.file = {
		".config/nvim" = {
			enable = true;
			source = ./general_nvim;
			recursive = true;
		};
	};
}
