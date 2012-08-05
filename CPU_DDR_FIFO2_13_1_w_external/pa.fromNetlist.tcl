
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name CPU_DDR_FIFO2 -dir "/DIST/home/peters/cam_repo/CPU_DDR_FIFO2/planAhead_run_1" -part xc5vlx110tff1136-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/DIST/home/peters/cam_repo/CPU_DDR_FIFO2/CPU_DDR_FIFO_tl.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/DIST/home/peters/cam_repo/CPU_DDR_FIFO2} {../FIFO/FIFO_ASYNCH/ipcore_dir} }
add_files "/DIST/home/peters/cam_repo/CPU_DDR_FIFO2/ilmb_wrapper.ncf" "/DIST/home/peters/cam_repo/CPU_DDR_FIFO2/Mikroblaze.ncf" "/DIST/home/peters/cam_repo/CPU_DDR_FIFO2/dlmb_wrapper.ncf" "/DIST/home/peters/cam_repo/CPU_DDR_FIFO2/microblaze_0_wrapper.ncf" "/DIST/home/peters/cam_repo/CPU_DDR_FIFO2/ddr2_sdram_wrapper.ncf" "../FIFO/FIFO_ASYNCH/ipcore_dir/fifo_two_clock_domains.ncf" -fileset [get_property constrset [current_run]]
set_param project.paUcfFile  "CPU_DDR_FIFO_tl.ucf"
add_files "CPU_DDR_FIFO_tl.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
