
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name System_VFBC -dir "/DIST/home/peters/nadja_cam_repo/VFBC_old/planAhead_run_1" -part xc5vlx110tff1136-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/DIST/home/peters/nadja_cam_repo/VFBC_old/System_tl.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/DIST/home/peters/nadja_cam_repo/VFBC_old} {FIFO_13_1_asynch} {FIFO_13_1_asynch/ipcore_dir} }
add_files [list {/DIST/home/peters/nadja_cam_repo/VFBC_old/ilmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/DIST/home/peters/nadja_cam_repo/VFBC_old/MB.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/DIST/home/peters/nadja_cam_repo/VFBC_old/dlmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/DIST/home/peters/nadja_cam_repo/VFBC_old/microblaze_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/DIST/home/peters/nadja_cam_repo/VFBC_old/ddr2_sdram_wrapper.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "System_dma_tl.ucf" [current_fileset -constrset]
add_files [list {System_dma_tl.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
