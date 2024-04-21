{ config, pkgs, ...}:
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
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

}