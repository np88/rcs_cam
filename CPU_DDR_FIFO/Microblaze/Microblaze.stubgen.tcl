cd /DIST/home/peters/cam_repo/CPU_DDR_FIFO/Microblaze/
if { [ catch { xload xmp Microblaze.xmp } result ] } {
  exit 10
}
xset hdl vhdl
run stubgen
exit 0
