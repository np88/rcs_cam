proc exportToSDK {} {
  cd /DIST/home/peters/nadja_cam_repo/System_VFBC/MB
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

set sExportDir [ xget sdk_export_dir ]
set sExportDir [ file join "/DIST/home/peters/nadja_cam_repo/System_VFBC/MB" "$sExportDir" "hw" ] 
if { [ file exists /DIST/home/peters/nadja_cam_repo/VFBC_test/edkBmmFile_bd.bmm ] } {
   puts "Copying placed bmm file /DIST/home/peters/nadja_cam_repo/VFBC_test/edkBmmFile_bd.bmm to $sExportDir" 
   file copy -force "/DIST/home/peters/nadja_cam_repo/VFBC_test/edkBmmFile_bd.bmm" $sExportDir
}
if { [ file exists /DIST/home/peters/nadja_cam_repo/VFBC_test/System_tl.bit ] } {
   puts "Copying bit file /DIST/home/peters/nadja_cam_repo/VFBC_test/System_tl.bit to $sExportDir" 
   file copy -force "/DIST/home/peters/nadja_cam_repo/VFBC_test/System_tl.bit" $sExportDir
}
exit $result
