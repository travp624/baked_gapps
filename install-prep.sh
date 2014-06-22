#!/sbin/sh
# GApps Install Preparation Script

echo -n -e "# begin Baked gapps properties\n# This file contains information needed to flash Baked gapps\n"  > /tmp/info.prop

# Does device qualify for FaceUnlock?
good_ffc_device() {
  if [ -f /sdcard/Baked/.forcefaceunlock ]; then
    return 0
  fi
  if cat /proc/cpuinfo |grep -q Victory; then
    return 1
  fi
  if cat /proc/cpuinfo |grep -q herring; then
    return 1
  fi
  if cat /proc/cpuinfo |grep -q sun4i; then
    return 1
  fi
  return 0
}

# Final determination to decide if FaceUnlock should be installed
if good_ffc_device && [ -e /system/etc/permissions/android.hardware.camera.front.xml ]; then
    echo -e "\ninstall.faceunlock=true" >> /tmp/info.prop
else
    echo -e "\ninstall.faceunlock=false" >> /tmp/info.prop
fi

echo -e "\n# end Baked gapps properties" >> /tmp/info.prop

# Copy info.prop to Baked folder on SD Card
cp -af /tmp/info.prop /sdcard/Baked/logs/info.prop
