#!/sbin/sh

. /tmp/backuptool.functions

case "$1" in
  backup)
    # Stub
  ;;
  restore)
    rm -f /system/app/Browser.apk /system/priv-app/Browser.apk /system/app/ChromeBookmarksSyncAdapter.apk /system/priv-app/ChromeBookmarksSyncAdapter.apk
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
	# Stub
;;
esac
