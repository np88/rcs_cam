proc pnsynth {} {
  cd /DIST/home/peters/cam_repo/CPU_DDR_FIFO2/Mikroblaze
  if { [ catch { xload xmp Mikroblaze.xmp } result ] } {
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
