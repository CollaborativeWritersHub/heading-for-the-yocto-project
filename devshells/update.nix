{ pkgs, ... }:
# Shell for refreshing the gem pins. It uses a plain bundler and ruby on
# purpose: the default shell wraps them through bundlerEnv, which points
# BUNDLE_GEMFILE at the store, so `bundle lock` there would not touch the
# Gemfile.lock in this repository.
pkgs.mkShellNoCC {
  packages = with pkgs; [
    bundler
    bundix
    ruby
  ];
}
