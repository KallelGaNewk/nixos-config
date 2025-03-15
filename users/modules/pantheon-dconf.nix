{ config, ... }:
{
  dconf = {
    enable = true;
    settings = {
      # Nautilus configuration
      "org/gtk/gtk4/settings/file-chooser".show-hidden = true;
      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "list-view";
        show-delete-permanently = true;
      };
      "org/gnome/nautilus/list-view" = {
        use-tree-view = true;
        default-zoom-level = "small";
        default-visible-columns = [
          "name"
          "size"
          "owner"
          "group"
          "permissions"
          "date_modified"
        ];
      };
    };
  };
}
