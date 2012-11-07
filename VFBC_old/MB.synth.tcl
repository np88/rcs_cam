proc pnsynth {} {
  cd /DIST/home/peters/nadja_cam_repo/VFBC_old/MB
  if { [ catch { xload xmp MB.xmp } result ] } {
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
