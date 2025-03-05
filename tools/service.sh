(
  # wait for boot to complete
  while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 1
  done
  sleep 3
  cmd overlay enable com.android.internal.systemui.navbar_spaced.gestural
  # Wait for unlocking the device
  until [ -d /sdcard/ ]; do
    sleep 1
  done
  sleep 30
  wm density 432
  settings put global back_navigation_animation 1
)& # launch in background
