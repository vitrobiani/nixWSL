{ pkgs, userSettings, ... }:
let

  # My shell aliases
  myAliases = {
    please = "sudo";
    ls = "eza --icons -l -T -L=1";
    ll = "ls -a";
    m = "pwd|>~/.config/loc.txt";
    tp = "cd $(cat ~/.config/loc.txt)";
    flakeconf = "nv ~/.HomeFlake/flake.nix";
    nvconf = "X=$(pwd) && cd ~/.HomeFlake/user/app/neovim/$\{PROFILE%%-*\}_nvim/ && nv . && cd $X";
    nixconf = "sudo nvim /etc/nixos/configuration.nix";
    update = "X=$(pwd) && cd ~/.HomeFlake && git add -A && home-manager switch --flake ~/.HomeFlake && cd $X";
    addProf = "X=$(pwd) && cd ~/.HomeFlake && ./addProfile.sh && cd $X";
    rmProf = "X=$(pwd) && cd ~/.HomeFlake && ./rmProfile.sh && cd $X";
    chProf = "X=$(pwd) && cd ~/.HomeFlake && ./changeProfile.sh && cd $X";
    prof = "echo $PROFILE";
    homenix = "nv ~/.HomeFlake/profiles/$PROFILE/home.nix";
    tm = "tmux";
    tma = "tm attach";
    tmt = "tma -t";
    ntm = "tm new -s";
    ktm = "tm kill-session -t";
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
    ks = "~/.HomeFlake/scripts/ks.sh";
  };
in
{

    # PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
    #  %F{green}→%f "
    # RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
    # [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
    #
  programs = {
     zsh = {
       enable = true;
       autosuggestion.enable = true;
       autocd = true;
       syntaxHighlighting.enable = true;
       enableCompletion = true;
       shellAliases = myAliases;
       oh-my-zsh = {
          enable = true;
          plugins = [ "git" "python" "man" "kubectl" ];
          theme = "bira";
       # darkblood , avit , bureau , dogenpunk , fino-time , jonathan , linuxonly, trapd00r
        };
       initExtra = ''
        mcd() {
            test -d "$1" || mkdir "$1" && cd "$1"
        }

        tdif() {
            # Capture the start time
            local start_time=$(date +%s%N)

            # Run the command with any arguments passed
            "$@"

            # Capture the end time
            local end_time=$(date +%s%N)

            # Calculate the elapsed time

            local elapsed_time=$(( (end_time - start_time) / 1000000 ))

            # Display the time taken to run the command
            echo "Command took $elapsed_time milliseconds."
        }

        upsay() {
            cows_list=(
                "beavis.zen" "blowfish" "bong" "bud-frogs" "bunny" "cheese" "cower" "daemon" "default" "dragon"
                "dragon-and-cow" "elephant" "elephant-in-snake" "eyes" "flaming-sheep" "ghostbusters"
                "head-in" "hellokitty" "kiss" "kitty" "koala" "kosh" "llama" "luke-koala" "meow" "milk" "moofasa"
                "moose" "mutilated" "ren" "satanic" "sheep" "skeleton" "small" "sodomized" "stegosaurus"
                "stimpy" "supermilker" "surgery" "telebears" "three-eyes" "turkey" "turtle" "tux" "udder"
                "vader" "vader-koala")

            r=$[ $RANDOM % 45 ]
            random_cow=$cows_list[$r]
            if [[ -z "$1" ]]; then
                fortune | cowsay -f "$random_cow"
            else
                echo "$1" | cowsay -f "$random_cow"
            fi
        }

        LAST_RUN_FILE="$HOME/.last_fortune_run"

        current_time=$(date +%s)

        if [[ -f $LAST_RUN_FILE ]]; then
          last_run_time=$(cat $LAST_RUN_FILE)
        else
          last_run_time=0
        fi

        time_diff=$((current_time - last_run_time))

        if [[ $time_diff -ge 3600 ]]; then
            cows_list=(
                "beavis.zen" "blowfish" "bong" "bud-frogs" "bunny" "cheese" "cower" "daemon" "default" "dragon"
                "dragon-and-cow" "elephant" "elephant-in-snake" "eyes" "flaming-sheep" "ghostbusters"
                "head-in" "hellokitty" "kiss" "kitty" "koala" "kosh" "llama" "luke-koala" "meow" "milk" "moofasa"
                "moose" "mutilated" "ren" "satanic" "sheep" "skeleton" "small" "sodomized" "stegosaurus"
                "stimpy" "supermilker" "surgery" "telebears" "three-eyes" "turkey" "turtle" "tux" "udder"
                "vader" "vader-koala")

            r=$[ $RANDOM % 45 ]
            random_cow=$cows_list[$r]
            fortune | cowsay -f "$random_cow"
            echo "$current_time" > $LAST_RUN_FILE
        fi


       '';
     };

        # random_cow=$\{opts[RANDOM % $\{#opts[@]\} + 1]\}
        # fortune | cowsay -f "$random_cow"

     bash = {
       enable = true;
       enableCompletion = true;
       shellAliases = myAliases;
     };

     fish = {
       enable = true;
       shellAliases = myAliases;
     };

     zellij = {
        enable = true;
        # enableZshIntegration = true;
     };

     tmux = {
         enable = true;
         plugins = with pkgs; [
           tmuxPlugins.yank
           tmuxPlugins.tmux-fzf
           tmuxPlugins.sensible
           # tmuxPlugins.power-theme
           tmuxPlugins.onedark-theme
           tmuxPlugins.sidebar
           tmuxPlugins.mode-indicator
           tmuxPlugins.vim-tmux-navigator
         ];
         keyMode = "vi";
         prefix = "C-a";
         mouse = true;
         baseIndex = 1;
         extraConfig = ''
            set -g set-clipboard on
            bind ^C new-window -c "#{pane_current_path}"
            bind v split-window -v -c "#{pane_current_path}"
            bind h split-window -h -c "#{pane_current_path}"
            bind S choose-session
            bind ^D detach
            bind : command-prompt
            bind w choose-window
            bind r command-prompt "rename-window %%"
            set-option -g status-position top
         '';
     };
  };

  # home.file = {
  #     ".config/tmux".source = ../app/tmux;
  #     ".tmux/plugins/tpm".source = ../app/tpm;
  # };

  home.packages = with pkgs; [
    disfetch lolcat cowsay onefetch fortune
    gnugrep gnused
    bat eza bottom fd bc
    direnv nix-direnv
    oh-my-zsh tmux
  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}
