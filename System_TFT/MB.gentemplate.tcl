proc pngeninsttemplate {} {
  cd /DIST/home/peters/cam_repo/System_TFT/MB
  if { [ catch { xload xmp MB.xmp } result ] } {
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
