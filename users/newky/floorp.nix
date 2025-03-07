{ config, pkgs, ... }:

{
  programs.floorp = {
    enable = true;
    package = (pkgs.wrapFirefox (pkgs.floorp-unwrapped.override { pipewireSupport = true; }) {});
    profiles.default = {
      bookmarks = [
        {
          name = "Toolbar";
          toolbar = true;
          bookmarks = [
            { name = ""; url = "https://mail.google.com/mail/u/0/"; }
            { name = ""; url = "https://www.youtube.com/"; }
            { name = ""; url = "https://cobalt.tools/"; }
            { name = ""; url = "https://github.com/"; }
            { name = ""; url = "https://www.instagram.com/ian_kallel/"; }
          ];
        }
      ];
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        clearurls
      ];
      settings = {
        "browser.uiCustomization.state" = (builtins.readFile ../../assets/floorp-uiState.json);
        "floorp.lepton.interface" = 1;
        "browser.bookmarks.restore_default_bookmarks" = false;
        "browser.download.panel.shown" = true;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.floorp.background.type" = 0;
        "browser.newtabpage.activity-stream.floorp.newtab.backdrop.blur.disable" = true;
        "browser.newtabpage.activity-stream.floorp.newtab.imagecredit.hide" = true;
        "browser.newtabpage.activity-stream.floorp.newtab.releasenote.hide" = true;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.pinned" = [];
        "browser.tabs.warnOnClose" = false;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.translations.neverTranslateLanguages" = "pt";
        "browser.translations.panelShown" = true;
        "browser.urlbar.suggest.trending" = false;
        "findbar.highlightAll" = true;
        "floorp.browser.sidebar.enable" = false;
        "floorp.browser.ssb.enabled" = false;
        "floorp.browser.workspaces.enabled" = false;
        "floorp.disable.fullscreen.notification" = true;
        "pref.privacy.disable_button.view_passwords" = false;
        "privacy.clearOnShutdown_v2.cache" = false;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = false;
        "userChrome.autohide.back_button" = true;
        "userChrome.autohide.forward_button" = true;
        "userChrome.autohide.navbar" = false;
        "userChrome.autohide.page_action" = true;
        "userChrome.autohide.sidebar" = false;
        "userChrome.autohide.tab" = false;
        "userChrome.centered.bookmarkbar" = false;
        "userChrome.centered.tab" = false;
        "userChrome.centered.urlbar" = false;
        "userChrome.sidebar.overlap" = false;
        "userChrome.tabbar.as_titlebar" = false;
        "userChrome.tabbar.one_liner" = false;
        "userChrome.urlView.always_show_page_actions" = false;
        "userChrome.urlView.move_icon_to_left" = false;
      };
    };
  };
}
