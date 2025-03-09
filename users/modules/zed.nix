{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "html"
      "just"
      "nix"
      "toml"
      "vscode-dark-modern"
    ];
    extraPackages = with pkgs; [
      nixd
      rust-analyzer
      nixfmt-rfc-style
    ];
    userSettings = {
      theme = {
        mode = "system";
        light = "Ayu Light";
        dark = "VSCode Dark Modern";
      };
      buffer_font_family = "Cascadia Code";
      buffer_font_features.calt = true;
      buffer_font_size = 15;
      buffer_font_weight = 350;
      buffer_line_height = "comfortable";
      when_closing_with_no_tabs = "keep_window_open";
      inlay_hints.enabled = true;
      autosave = "on_focus_change";
      tabs = {
        file_icons = true;
        show_diagnostics = "all";
      };

      # Configure this? from wiki.nixos.org/wiki/Zed
      lsp = {
        rust-analyzer.binary = {
          path = lib.getExe pkgs.rust-analyzer;
        };
        # nixd.binary = {
        #   path = lib.getExe pkgs.nixd;
        # };
      };

      languages.Nix.language_servers = [
        "nixd"
        "!nil"
      ];

      # tab_size = 4;
      # prettier.tabWidth = 4;

      telemetry = {
        metrics = false;
        diagnostics = false;
      };
    };
  };
}
