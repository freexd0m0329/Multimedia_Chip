set_clock_latency 1  [get_clocks {clk}]
set_clock_latency -source -early -min  0 [get_clocks {clk}]
set_clock_latency -source -early -max  0 [get_clocks {clk}]
set_clock_latency -source -late -min  0 [get_clocks {clk}]
set_clock_latency -source -late -max  0 [get_clocks {clk}]
set_clock_latency -source -early -max -rise  -1.56222 [get_ports {clk}] -clock clk 
set_clock_latency -source -early -max -fall  -1.74154 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -max -rise  -1.56222 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -max -fall  -1.74154 [get_ports {clk}] -clock clk 
