# PipeWire and RealtimeKit system service configuration

{ config, ... }: {
  hardware.pulseaudio.enable = false;
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
