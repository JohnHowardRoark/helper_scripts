#! /bin/bash

# Reset all desktop font settings using gsettings.
# Updates from System76 seem to often screw up the desktop fonts

gsettings reset org.gnome.desktop.interface font-name
gsettings reset org.gnome.desktop.interface document-font-name
gsettings reset org.gnome.desktop.interface monospace-font-name
gsettings reset org.gnome.desktop.wm.preferences titlebar-font
# This next one returns an error:
# gsettings reset org.gnome.nautilus.desktop font
gsettings reset org.gnome.desktop.interface text-scaling-factor
