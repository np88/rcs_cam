cd /DIST/home/peters/nadja_cam_repo/VFBC_old/MB
if { [ catch { xload xmp MB.xmp } result ] } {
  exit 10
}

if { [catch {run init_bram} result] } {
  exit -1
}

exit 0
