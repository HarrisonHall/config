# Patches
Patching dwm is simple.

## Adding patches
`patch -p1 < patches/patch_name.diff`

## Removing patches
`patch -p1 -R < patches/patch_name.diff`

## Current patches
* [ ] `activetageindicatorbar.diff` - uses bar instead of box to show active tag
* [x] `alt_tags.diff` - use alternative unicode to show bars
* [x] `autostart.diff` - run autostart bash scripts
* [x] `awesomebar.diff` - interactive title bar
* [x] `combo.patch` - select multiple tags at one time
* [x] `focusonnetactive.diff` - focus on the active window (games)
* [x] `fullgaps.diff` - show gaps between windows, imo better than uselessgaps
* [x] `noborder-fixed.diff` - no border in monacle mode
* [x] `restartsig.diff` - restart dwm with new config
* [ ] `resizecorners.diff` - resize dwm from nearest corner
* [x] `status2d.diff` - show colors in the status bar
* [ ] `steam.diff` - do something? for steam notification
* [ ] `warp.diff` - warp mouse to active window
