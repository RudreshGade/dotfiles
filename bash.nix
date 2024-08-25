{ config, inputs, pkgs, ... }:
{

  programs.bash = {
    shellAliases = {
     
      upgrade = "sudo nix flake update" ;
      reincarnate = "sudo nixos-rebuild switch --flake .";
      itachi-kill = "sudo nix-store --gc ";
      itachi-killall = "sudo nix-collect-garbage -d";
      
      powertop = "sudo powertop";
      htop = "sudo htop";

      ssd-health = "sudo nvme smart-log /dev/nvme0n1";
      battery-health = "upower -d";
      
      deep-repair = "sudo nix-store --verify --check-contents --repair";
      quick-repair = "sudo nixos-rebuild switch --repair";
    };
  };
}
