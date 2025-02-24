(
  while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 1
  done
  sleep 3
  cmd overlay enable com.android.internal.systemui.navbar_spaced.gestural
)& # wait for completing boot in background
