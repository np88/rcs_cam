cd /DIST/home/peters/cam_repo/System_DMA/MB
if { [ catch { xload xmp MB.xmp } result ] } {
  exit 10
}

if { [catch {run init_bram} result] } {
  exit -1
}

exit 0
