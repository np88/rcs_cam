proc pngeninsttemplate {} {
  cd /DIST/home/peters/cam_repo/CPU_DDR_FIFO/Microblaze
  if { [ catch { xload xmp Microblaze.xmp } result ] } {
    exit 10
  }
  if { [catch {run mhs2hdl} result] } {
    return -1
  }
  return 0
}
if { [catch {pngeninsttemplate} result] } {
  exit -1
}
exit $result
