SetActiveLib -work
comp -include "$dsn\src\lfsr64.vhd" 
comp -include "$dsn\src\TestBench\lfsr_TB.vhd" 
asim +access +r TESTBENCH_FOR_lfsr 
wave 
wave -noreg clk
wave -noreg reset
wave -noreg Q
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\lfsr_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_lfsr 
