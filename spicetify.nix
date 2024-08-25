{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify.homeManagerModules.default ];

  programs.spicetify = {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      playlistIcons
      lastfm
      genre
      historyShortcut
      hidePodcasts
      fullAppDisplay
      shuffle
    ];

    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      ncsVisualizer
      historyInSidebar
    ];

    theme = spicePkgs.themes.sleek;

    colorScheme = "Cherry";
  };
}
