read_liberty /mnt/volume_nyc1_01/skywater-pdk/libraries/sky130_fd_sc_hd/latest/timing/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog micro_gl.v
link_design micro
create_clock -name clk -period 10
set_input_delay -clock clk 0 {reset mem_dout clk}
set_output_delay -clock clk 0 {mem_addr mem_din}
report_checks
report_power
exit
