
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name FIFO_13_1_asynch -dir "/DIST/home/peters/cam_repo/System_V1/FIFO_13_1_asynch/planAhead_run_1" -part xc5vlx110tff1136-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/DIST/home/peters/cam_repo/System_V1/FIFO_13_1_asynch/FIFO_asynch13_1_tl.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/DIST/home/peters/cam_repo/System_V1/FIFO_13_1_asynch} {ipcore_dir} }
add_files "ipcore_dir/fifo_13_1_asynch.ncf" -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "FIFO_asynch13_1_tl.ucf"
add_files "FIFO_asynch13_1_tl.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
