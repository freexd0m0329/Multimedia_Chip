#Front-end DC's netlist and WLM
#Back-end Layout's netlist and spef file
set power_enable_analysis TRUE
set power_analysis_mode time_based

read_file -format verilog  ./chip_syn.v
current_design CHIP
link

source ./CHIP_pt.tcl
#read_parasitics -format SPEF -verbose  CHIP.spef

report_timing

## Measure  power
read_vcd  -strip_path test/CHIP ./CHIP_syn.vcd -time  {50  1055}
#report_switching_activity -list_not_annotated -show_pin

set_power_analysis_options -waveform_format fsdb -waveform_output lab3_pwr -waveform_interval 0.00001
update_power

report_power


