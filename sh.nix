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
    # Nearly all configs found online had lowercase "A"utosu..., only works for me with uppercase
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

}