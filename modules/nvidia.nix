{
  hardware.graphics = {
    enable = true;
    # Enable if having problems with Wine or Proton
    # enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    enabled = true;
    open = true;
    nvidiaSettings = false;
  };

}
