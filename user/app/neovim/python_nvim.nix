{ config, pkgs, userSettings, ... }:

{
	home.file = {
		".config/nvim" = {
			enable = true;
			source = ./python_nvim;
			recursive = true;
		};
	};
}
