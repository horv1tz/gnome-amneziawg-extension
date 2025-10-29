{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.glib
    pkgs.gnome-extensions-cli
  ];
}
