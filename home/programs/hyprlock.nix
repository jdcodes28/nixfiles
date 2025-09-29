{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
        no_fade_in = false;
        disable_loading_bar = false;
        ignore_empty_input = true;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
        }
      ];

      input-field = [
        {
          outer_color = "rgba(00ffffbe) rgba(ee00ffbe) rgba(00ffffbe) rgba(ee00ffbe) rgba(00ffffbe) rgba(ee00ffbe) rgba(00ffffbe) rgba(ee00ffbe) rgba(00ffffbe) rgba(ee00ffbe) rgba(00ffffbe) rgba(ee00ffbe)";
          inner_color = "rgba(75, 75, 75, 1.0)";
          font_color = "rgba(255, 255, 255, 1.0)";
          font_family = "TX-02";
          fade_on_empty = false;
          placeholder_text = "Enter password";
          fail_text = "$FAIL ($ATTEMPTS)";
        }
      ];

      label = [
        {
          text = "$TIME";
          font_size = 75;
          font_family = "TX-02";
          position = "0%, 22%";
        }
        {
          text = ''cmd[update:1000] echo "$(date +'%A, %B %e, %Y')"'';
          font_size = 22;
          font_family = "TX-02";
          position = "0%, 11%";
        }
      ];
    };
  };
}