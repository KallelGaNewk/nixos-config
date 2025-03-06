# PipeWire and RealtimeKit system service configuration

{ config, ... }: {
  security.rtkit.enable = true; # Acquire realtime priority
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    #jack.enable = true;
  };
}
