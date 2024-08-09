{ config, inputs, pkgs, ... }:
{

  programs.bash = {
    shellAliases = {
      powertop = "sudo powertop";
      htop = "sudo htop";
      battery-health = "upower -d";
      upgrade = "sudo nix flake update" ;
      ssd-health = "sudo nvme smart-log /dev/nvme0n1";
      reincarnate = "sudo nixos-rebuild switch --flake .";
      deep-repair = "sudo nix-store --verify --check-contents --repair";
      quick-repair = "sudo nixos-rebuild switch --repair";
    };
  };
}
