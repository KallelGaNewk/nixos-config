{ pkgs, lib, ... }: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "catppuccin-blur"
      "html"
      "just"
      "nix"
      "toml"
      "vscode_dark_modern"
    ];
    extraPackages = with pkgs; [
      nixd
      rust-analyzer
    ];
    userSettings = {
      theme = {
        mode = "system";
        light = "Catppuccin Latte (Blur)";
        dark = "Catppuccin Espresso (Blur)";
      };
      buffer_font_family = "Cascadia Code";
      buffer_font_features.calt = true;
      buffer_font_size = 15;
      buffer_font_weight = 300;
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
      };

      # tab_size = 4;
      # prettier.tabWidth = 4;

      telemetry = {
        metrics = false;
        diagnostics = false;
      };
    };
  };
}
