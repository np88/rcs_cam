proc pnsynth {} {
  cd /DIST/home/peters/cam_repo/CPU_DDR_FIFO2_13_1/Microblaze
  if { [ catch { xload xmp Microblaze.xmp } result ] } {
    exit 10
  }
  if { [catch {run netlist} result] } {
    return -1
  }
  return $result
}
if { [catch {pnsynth} result] } {
  exit -1
}
exit $result
