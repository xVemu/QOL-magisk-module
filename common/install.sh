chmod +x "$MODPATH"/tools/*

#Find and delete conflicting overlays/package-cache/resource-cache
find /data/adb/modules -type d -not -path "*navbar-inset/system*" -iname "*navigationbarmodegestural*" -exec rm -rf {} \; 2>/dev/null
find /data/system/package_cache -type f -iname "*NavigationBarMode*" -exec rm -rf {} \; 2>/dev/null
find /data/resource-cache -type f -iname "*NavigationBarMode*" -exec rm -rf {} \; 2>/dev/null

#Folder creation and etc
mkdir "$MODPATH"/compiled
mkdir -p "$MODPATH"/system/app/NavigationBarModeSpacedGestural
cp -rf "$MODPATH"/tools/service.sh "$MODPATH"

#Building overlays
"$MODPATH"/tools/aapt2 compile -v --dir "$MODPATH"/apk/res -o "$MODPATH"/compiled
"$MODPATH"/tools/aapt2 link -v --no-resource-deduping -o "$MODPATH"/unsigned.apk -I /system/framework/framework-res.apk \
--manifest "$MODPATH"/apk/AndroidManifest.xml "$MODPATH"/compiled/*

#Signing
"$MODPATH"/tools/zipsigner "$MODPATH"/unsigned.apk "$MODPATH"/system/app/NavigationBarModeSpacedGestural/NavigationBarModeSpacedGesturalOverlay.apk

#Cleanup
rm -rf "$MODPATH"/compiled/
rm -rf "$MODPATH"/unsigned.apk
