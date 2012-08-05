cd /DIST/home/peters/cam_repo/CPU_DDR_FIFO2_13_1/Mikroblaze
if { [ catch { xload xmp Mikroblaze.xmp } result ] } {
  exit 10
}

if { [catch {run init_bram} result] } {
  exit -1
}

exit 0
