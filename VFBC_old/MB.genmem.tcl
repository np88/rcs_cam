if { [ catch { xload xmp /DIST/home/peters/cam_repo/System_VFBC/MB/MB.xmp } result ] } {
  exit 10
}
set gotbram [xget hasbram]
if { $gotbram == 1 } {
   #
   # Call the test bench generation
   if { [catch {run memgen -od /DIST/home/peters/cam_repo/System_VFBC /DIST/home/peters/cam_repo/System_VFBC/MB/MB.mhs} result ] } {
      puts "ERROR: xps 'run memgen' call failed"
      exit -1
   }
}
exit 0
