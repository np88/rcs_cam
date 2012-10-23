
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name System_VFBC -dir "/DIST/home/peters/nadja_cam_repo/System_VFBC/planAhead_run_2" -part xc5vlx110tff1136-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/DIST/home/peters/nadja_cam_repo/System_VFBC/System_tl.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/DIST/home/peters/nadja_cam_repo/System_VFBC} {FIFO_13_1_asynch} {FIFO_13_1_asynch/ipcore_dir} }
add_files "/DIST/home/peters/nadja_cam_repo/System_VFBC/ilmb_wrapper.ncf" "/DIST/home/peters/nadja_cam_repo/System_VFBC/MB.ncf" "/DIST/home/peters/nadja_cam_repo/System_VFBC/xps_tft_0_wrapper.ncf" "/DIST/home/peters/nadja_cam_repo/System_VFBC/dlmb_wrapper.ncf" "/DIST/home/peters/nadja_cam_repo/System_VFBC/microblaze_0_wrapper.ncf" "/DIST/home/peters/nadja_cam_repo/System_VFBC/ddr2_sdram_wrapper.ncf" -fileset [get_property constrset [current_run]]
set_param project.paUcfFile  "System_dma_tl.ucf"
add_files "System_dma_tl.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
