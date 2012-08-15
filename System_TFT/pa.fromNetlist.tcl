
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name System_TFT -dir "/DIST/home/peters/cam_repo/System_TFT/planAhead_run_2" -part xc5vlx110tff1136-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/DIST/home/peters/cam_repo/System_TFT/System_tl.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/DIST/home/peters/cam_repo/System_TFT} {FIFO_13_1_asynch} {FIFO_13_1_asynch/ipcore_dir} }
add_files "/DIST/home/peters/cam_repo/System_TFT/ilmb_wrapper.ncf" "/DIST/home/peters/cam_repo/System_TFT/MB.ncf" "/DIST/home/peters/cam_repo/System_TFT/xps_tft_0_wrapper.ncf" "/DIST/home/peters/cam_repo/System_TFT/dlmb_wrapper.ncf" "/DIST/home/peters/cam_repo/System_TFT/microblaze_0_wrapper.ncf" "/DIST/home/peters/cam_repo/System_TFT/ddr2_sdram_wrapper.ncf" -fileset [get_property constrset [current_run]]
set_param project.paUcfFile  "System_tft_tl.ucf"
add_files "System_tft_tl.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
