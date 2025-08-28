#!/usr/bin/env nu

def get-gnome-color-scheme [] {
    dconf read /org/gnome/desktop/interface/color-scheme | str trim
}

def set-gnome-themes [mode: string] {
    if $mode == "Dark" {
        print "Setting color scheme to prefer-dark"
        dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
        dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita-dark'"
        dconf write /org/gnome/desktop/interface/icon-theme "'Adwaita-dark'"
        dconf write /gtk3/extraConfig/gtk-application-prefer-dark-theme "1"
        hyprctl setcursor catppuccin-latte-light-cursors 24
    } else if $mode == "Light" {
        print "Setting color scheme to prefer-light"
        dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
        dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita'"
        dconf write /org/gnome/desktop/interface/icon-theme "'Adwaita'"
        dconf write /gtk3/extraConfig/gtk-application-prefer-dark-theme "0"
        hyprctl setcursor catppuccin-mocha-dark-cursors 24
    } else {
        print "Invalid mode. Please use 'Light' or 'Dark'."
    }
}

let current_gnome_mode = (get-gnome-color-scheme)
print $"Current mode: ($current_gnome_mode)"

if $current_gnome_mode == "'prefer-light'" {
    set-gnome-themes "Dark"
} else {
    set-gnome-themes "Light"
}