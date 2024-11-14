{ pkgs, config, lib, inputs, ... }:

{
  options.dizzler.programs.hyprland = {
    enable = lib.mkEnableOption "hyprland";
  };
  
  config = lib.mkIf config.dizzler.programs.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      package = inputs.hyprland.pacakges.${pkgs.system}.hyprland;
      plugins = [
        # import plugins here

      ];

      settings = {
        "$TERM" = "${pkgs.kitty}/bin/kitty";
	"$EDITOR" = "${pkgs.neovim}/bin/nvim";
	"$mainMod" = "SUPER";

	env = [
	  "TERM, $TERM"
	  "EDITOR, $EDITOR"
	  "XDG_CURRENT_DESKTOP,Hyprland"
	];

	input = {
	  kb_layout = "us";
	  follow_mouse = 2;
	  accel_profile = "adaptive";
	  sensitivity = 0;
	};

	debug.disable_logs = false;

	monitor = [
	  ",preferred,auto,1"
	];

	windowrulev2 = [
          # "center, floating:1"
	];

	exec-once = [
          "mako"
	  "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
	  "dbus-update-activation-environment --systemd --all"
	  "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
	];

	plugin = {
	  # manage plugins here
	};

	general = {
	  gaps_in = 5;
	  gaps_out = 10;
	  border_size = 2;
	  # "col.active_border" = "rgb()";
	  # "col.inactive_border" = "rgb()";
	  layout = master;
	};

	decoration = {
	  rounding = 5;
	  blur = {
	    enabled = false;
	    size = 3;
	    passes = 1;
	  };
	  shadow = {
            enabled = false;
	    range = 4;
	    render_power = 3;
	    color = "rgba(1a1a1aee)";
	  };
	};

	animations = {
	  enabled = true;
	  bezier = [
	    "myBezier, 0.05, 0.9, 0.1, 1.05"
	  ];
	  animation = [
	    "windows, 1, 7, myBezier"
	    "windowsOut, 1, 7, default, popin 80%"
	    "border, 1, 10, default"
	    "borderangle, 1, 8, default"
	    "fade, 1, 7, default"
	    "workspaces, 1, 6, default"
	  ];
	};
	
	bind = [
	  

	];
      };
    };
  };
}
