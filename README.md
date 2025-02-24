# QOL Magisk Module
## Basically does 3 things:
- sets navbar height to 24dp, so apps can apply insets
- sets device smallest width to 400 (432 device dpi)
- removes annoying notification about high volume

# Takeaways after building module
- Building apk on device in installation phase in faster to debug, rather than sending whole apk in zip
- You need special [aapt](https://github.com/AAGaming00/aapt2) or [aapt264](https://github.com/Magisk-Modules-Alt-Repo/HideNavBar/blob/master/tools/aapt264), otherwise you cannot link `/system/framework/framework-res.apk` because of permissions. You can also copy that apk to windows
- You shouldn't mount apps directly in `/system/product`, because it breaks navbar. Navbar becomes combination of two-buttons + three-buttons and gesture navbar acts like 3-buttons
- `Overlay fabricate` works only for colors in recent android versions
- Modules don't override files, only mounts them. After uninstalling everything goes back to stock
- [jadx](https://github.com/skylot/jadx) is more trusted in inspecting apk than mix explorer
- META-INF is required when replacing `/system/product`
- See [AndroidManifest.xml](apk/AndroidManifest.xml)
- [zipsigner](tools/zipsigner) must be LF
