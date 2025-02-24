& "$env:ProgramFiles\7-Zip\7z.exe" a qol.zip ./apk/ ./common/ ./META-INF/ ./system/ ./tools/ ./customize.sh ./module.prop ./uninstall.sh
adb push qol.zip /sdcard/Download
rm qol.zip
