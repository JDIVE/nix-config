{ pkgs, ...}:
let
  myAliases = {
    ll = "ls -l";
    
    ".." = "cd ..";

    ts = "tailscale";
    tssh = "tailscale ssh";
    tst = "tailscale status";
    tsu = "tailscale up --ssh --operator=$USER";
    tsd = "tailscale down";
  };
  in
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    # Nearly all configs found online had Autosuggestions.enable which does not work for me
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
  };
  };

}