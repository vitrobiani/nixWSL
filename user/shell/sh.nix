{ pkgs, ... }:
let

  # My shell aliases
  myAliases = {
    please = "sudo";
    ls = "eza --icons -l -T -L=1";
    ll = "ls -a";
    m = "pwd|>~/.config/loc.txt";
    tp = "cd $(cat ~/.config/loc.txt)";
    flakeconf = "X=$(pwd) && cd ~/.HomeFlake/ && nv . && cd $X";
    nvconf = "X=$(pwd) && cd ~/.HomeFlake/user/app/nvim-setup/nvim/ && nv . && cd $X";
    nixconf = "sudo nvim /etc/nixos/configuration.nix";
    update = "X=$(pwd) && cd ~/.HomeFlake && git add -A && home-manager switch --flake ~/.HomeFlake && cd $X";
    rr = "ranger";
    nv = "nvim";
    q = "exit";
    cat = "bat";
    htop = "btm";
    fd = "fd -Lu";
    w3m = "w3m -no-cookie -v";
    neofetch = "disfetch";
    fetch = "disfetch";
    gitfetch = "onefetch";
    fz = "fzf --preview='cat {}'";
    nfz = "nvim $(fz)";
  };
in
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
    initExtra = ''
    PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
     %F{green}→%f "
    RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
    [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
    '';
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  programs.fish = {
    enable = true;
    shellAliases = myAliases;
  };

  home.packages = with pkgs; [
    disfetch lolcat cowsay onefetch
    gnugrep gnused
    bat eza bottom fd bc
    direnv nix-direnv
  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}
