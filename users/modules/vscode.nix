# { pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      # extensions = with pkgs.vscode-extensions; [ ];
      userSettings = {
        "diffEditor.renderSideBySide" = false;
        "editor.fontFamily" = "Cascadia Code";
        "editor.fontLigatures" = true;
        "editor.inlayHints.fontSize" = 12;
        "editor.minimap.enabled" = false;
        "editor.renderFinalNewline" = "dimmed";
        "editor.renderLineHighlightOnlyWhenFocus" = true;
        "editor.renderWhitespace" = "trailing";
        "editor.smoothScrolling" = true;
        "window.commandCenter" = true;
        "window.dialogStyle" = "custom";
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.list.smoothScrolling" = true;
        "workbench.productIconTheme" = "material-product-icons";
        # Theme - Cursor
        "editor.cursorBlinking" = "expand";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.cursorStyle" = "line";
        # Theme - Cursor - Terminal
        "terminal.integrated.cursorBlinking" = true;
        "terminal.integrated.cursorStyle" = "line";
        "terminal.integrated.cursorWidth" = 2;
        "terminal.integrated.fontFamily" = "Cascadia Code NF";
        "terminal.integrated.smoothScrolling" = true;
        # QOL - Editor
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
        "editor.inlineSuggest.enabled" = true;
        "editor.tabSize" = 4;
        "explorer.confirmDragAndDrop" = false;
        "files.insertFinalNewline" = true;
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "workbench.startupEditor" = "none";
        # QOL - Git
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.enableSmartCommit" = true;
        # QOL - Terminal
        "terminal.integrated.scrollback" = 150000;
        # Security
        "editor.unicodeHighlight.includeStrings" = false;
        "explorer.confirmDelete" = false;
        "gitlens.telemetry.enabled" = false;
        "security.workspace.trust.enabled" = false;
        "telemetry.telemetryLevel" = "off";
        # Plugin specific
        "chat.commandCenter.enabled" = false;
        "diffEditor.ignoreTrimWhitespace" = false;
        "files.autoSave" = "afterDelay";
        "gitlens.codeLens.enabled" = false;
        "gitlens.hovers.currentLine.over" = "line";
        "gitlens.showWhatsNewAfterUpgrades" = false;
        "hexeditor.showOpenFileButton" = true;
        "material-icon-theme.folders.theme" = "specific";
        "rust-analyzer.inlayHints.chainingHints.enable" = false;
        "rust-analyzer.interpret.tests" = true;
        "rust-analyzer.lens.implementations.enable" = false;
      };
    };
  };
}
