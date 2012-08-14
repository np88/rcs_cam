proc exportToSDK {} {
  cd /DIST/home/peters/cam_repo/System_DMA/MB
  if { [ catch { xload xmp MB.xmp } result ] } {
    exit 10
  }
  if { [run exporttosdk] != 0 } {
    return -1
  }
  return 0
}

if { [catch {exportToSDK} result] } {
  exit -1
}

exit $result
