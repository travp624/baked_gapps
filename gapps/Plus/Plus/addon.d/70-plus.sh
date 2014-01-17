#!/sbin/sh
#
# /system/addon.d/70-gapps.sh
#
. /tmp/backuptool.functions

list_files() {
cat <<EOF
app/PlusOne.apk
lib/libfilterframework_jni.so
lib/libmoviemaker-jni.so
lib/libnetjni.so
lib/libplus_jni_v8.so
lib/librs.antblur.so
lib/librs.antblur_constant.so
lib/librs.antblur_drama.so
lib/librs.drama.so
lib/librs.film_base.so
lib/librs.fixedframe.so
lib/librs.grey.so
lib/librs.image_wrapper.so
lib/librs.retrolux.so
lib/librsjni.so
lib/libRSSupport.so
lib/libwebp_android.so
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/$FILE
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/$FILE $R
    done
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
