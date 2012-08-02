cd /DIST/home/peters/cam_repo/CPU_DDR_FIFO2/Mikroblaze
if { [ catch { xload xmp Mikroblaze.xmp } result ] } {
  exit 10
}
xset intstyle default
save proj
exit 0
