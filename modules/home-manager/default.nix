{ pkgs, lib, ... }: {
  fonts.fontconfig.enable = true;
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    curl
    fd
    go
    ripgrep
    rustup
  ];
  programs = {
    home-manager.enable = true;
    alacritty = {
      enable = true;
    };
    eza.enable = true;
    git = {
      enable = true;
      ignores = [ ".DS_Store" ];
      userName = "Bram Buijs";
      userEmail = "bram.buijs@hurricanecommerce.com";
      extraConfig = {
        core.editor = "vim";
      };
    };
    kitty = {
      enable = true;
    };
    neovim =
      {
        enable = true;
        plugins = with pkgs.vimPlugins; [
          nvim-treesitter.withAllGrammars
        ];
      };
    ssh = {
      enable = true;
      extraConfig = ''
              Host *
        	    IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"'';
    };
    starship.enable = true;
    starship.enableZshIntegration = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ls = "ls --color=auto -F";
        nixswitch = "darwin-rebuild switch --flake ~/src/system-config/.#";
        nixup = ''
          pushd ~/src/system-config
          nix flake update
          nixswitch
          popd
          brew cu
        '';
        sysconfig = "cd ~/src/system-config;codium ~/src/system-config";
        scdir = "cd ~/src/system-config/";
        workwork = ''
          open -g -a Mail
          open -g -a Slack
          open -g -a "Microsoft Teams"
          open -g -a zoom.us
        '';
        eod = ''
          osascript -e 'quit app "Slack"'
          osascript -e 'quit app "Microsoft Teams"'
          osascript -e 'quit app "Mail"'
          osascript -e 'quit app "zoom.us"'
        '';
        eodz = ''
          osascript -e 'quit app "Slack"'
          osascript -e 'quit app "Microsoft Teams"'
          osascript -e 'quit app "Mail"'
        '';
        mailz = ''/Users/bram/src/Python/PycharmProjects/emailAddressProcessor/.venv/bin/python /Users/bram/src/Python/PycharmProjects/emailAddressProcessor/main.py'';
      };
    };
  };
}
              