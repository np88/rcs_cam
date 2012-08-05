proc exportToSDK {} {
  cd /DIST/home/peters/cam_repo/System_V1/MB
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
set sExportDir [ file join "/DIST/home/peters/cam_repo/System_V1/MB" "$sExportDir" "hw" ] 
if { [ file exists /DIST/home/peters/cam_repo/System_V1/edkBmmFile_bd.bmm ] } {
   puts "Copying placed bmm file /DIST/home/peters/cam_repo/System_V1/edkBmmFile_bd.bmm to $sExportDir" 
   file copy -force "/DIST/home/peters/cam_repo/System_V1/edkBmmFile_bd.bmm" $sExportDir
}
if { [ file exists /DIST/home/peters/cam_repo/System_V1/System_tl.bit ] } {
   puts "Copying bit file /DIST/home/peters/cam_repo/System_V1/System_tl.bit to $sExportDir" 
   file copy -force "/DIST/home/peters/cam_repo/System_V1/System_tl.bit" $sExportDir
}
exit $result
