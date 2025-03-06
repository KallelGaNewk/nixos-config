{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [];
    userSettings = {
      "workbench.productIconTheme" = "material-product-icons";
      "workbench.iconTheme" = "material-icon-theme";
      "editor.fontFamily" = "Cascadia Code";
      "editor.fontLigatures" = true;
      "editor.inlayHints.fontSize" = 12;
      "editor.renderWhitespace" = "trailing";
      "editor.renderFinalNewline" = "dimmed";
      "editor.renderLineHighlightOnlyWhenFocus" = true;
      "editor.smoothScrolling" = true;
      "workbench.list.smoothScrolling" = true;
      "editor.minimap.enabled" = false;
      "window.commandCenter" = true;
      "window.dialogStyle" = "custom";
      "diffEditor.renderSideBySide" = false;
      # Theme - Cursor
      "editor.cursorStyle" = "line";
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.cursorBlinking" = "expand";
      # Theme - Cursor - Terminal
      "terminal.integrated.fontFamily" = "Cascadia Code";
      "terminal.integrated.cursorStyle" = "line";
      "terminal.integrated.cursorBlinking" = true;
      "terminal.integrated.cursorWidth" = 2;
      "terminal.integrated.smoothScrolling" = true;
      # QOL - Editor
      "editor.tabSize" = 4;
      "editor.formatOnSave" = true;
      "editor.formatOnPaste" = true;
      "explorer.confirmDragAndDrop" = false;
      "editor.inlineSuggest.enabled" = true;
      "files.insertFinalNewline" = true;
      "files.trimTrailingWhitespace" = true;
      "files.trimFinalNewlines" = true;
      "workbench.startupEditor" = "none";
      # QOL - Git
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.enableSmartCommit" = true;
      # QOL - Terminal
      "terminal.integrated.scrollback" = 150000;
      # Security
      "security.workspace.trust.enabled" = false;
      "explorer.confirmDelete" = false;
      "editor.unicodeHighlight.includeStrings" = false;
      "telemetry.telemetryLevel" = "off";
      "gitlens.telemetry.enabled" = false;
      # Plugin specific
      "hexeditor.showOpenFileButton" = true;
      "diffEditor.ignoreTrimWhitespace" = false;
      "gitlens.showWhatsNewAfterUpgrades" = false;
      "gitlens.codeLens.enabled" = false;
      "gitlens.hovers.currentLine.over" = "line";
      "files.autoSave" = "afterDelay";
      "chat.commandCenter.enabled" = false;
      "rust-analyzer.interpret.tests" = true;
      "rust-analyzer.lens.implementations.enable" = false;
      "rust-analyzer.inlayHints.chainingHints.enable" = false;
      "material-icon-theme.folders.theme" = "specific";
    };
  };
}
