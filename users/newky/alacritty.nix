{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = { x = 3; y = 3; };
        opacity = 0.8;
        blur = true;
      };
      font = {
        normal.family = "Cascadia Code";
        bold.family = "Cascadia Code";
        italic.family = "Cascadia Code";
        bold_italic.family = "Cascadia Code";
      };
      cursor = {
        style = {
          shape = "Beam";
          blinking = "Always";
        };
        unfocused_hollow = false;
      };
      mouse.hide_when_typing = true;
      keyboard.bindings = [
        { key = "N"; mods = "Control|Shift"; action = "CreateNewWindow"; }
      ];

      # (Github Dark) github.com/rojekt0n/github-theme-contrib
      colors = {
        primary = {
          background = "0x30363d";
          foreground = "0xe6edf3";
        };
        cursor = {
          text = "0x30363d";
          cursor = "0xe6edf3";
        };
        normal = {
          black = "0x484f58";
          red = "0xff7b72";
          green = "0x3fb950";
          yellow = "0xd29922";
          blue = "0x58a6ff";
          magenta = "0xbc8cff";
          cyan = "0x39c5cf";
          white = "0xb1bac4";
        };
        bright = {
          black = "0x6e7681";
          red = "0xffa198";
          green = "0x56d364";
          yellow = "0xe3b341";
          blue = "0x79c0ff";
          magenta = "0xbc8cff";
          cyan = "0x39c5cf";
          white = "0xb1bac4";
        };
      };
    };
  };
}
