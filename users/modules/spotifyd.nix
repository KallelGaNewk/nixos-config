{
  services.spotifyd = {
    enable = true;
    settings.global = {
      device_name = "Newky";
      zeroconf_port = 3535; # TCP
    };
  };
}
