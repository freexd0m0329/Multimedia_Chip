# Synthesis Homework

## 0. Environment Setup

```bash
# Copy File for env setting
cp /home/standard/multimedia_2024_HW/SYN_HW/* .
cp /home/standard/Environment_Setup_File/synthesis_setup_for_18/synopsys_dc.setup  .synopsys_dc.setup 
# Check File List
ls
$ control_test_syn.v  CS.v  in.dat  out.dat  out_golden.dat  pt_script.tcl  testfixture.v  testfixture.v~  tsmc18.v
# Run Design Vision
dv &
```

## 1. Analysis Design

```tcl
sh mkdir CS
define_design_lib CS -path ./CS
analyze -library CS -format verilog {/home/mm53/multimedia_2024_HW/SYN_HW/CS.v}
# design_vision> 
    # Running PRESTO HDLC
    # Compiling source file /home/mm53/multimedia_2024_HW/SYN_HW/CS.v
    # Presto compilation completed successfully.
    # Loading db file '/home/cell_lib/CBDK_TSMC018_Arm_v4.0/CIC/SynopsysDC/db/slow.db'
    # Loading db file '/home/cell_lib/CBDK_TSMC018_Arm_v4.0/CIC/SynopsysDC/db/fast.db'
    # Loading db file '/home/cell_lib/CBDK_TSMC018_Arm_v4.0/CIC/SynopsysDC/db/tpz973gvwc.db'
    # Loading db file '/home/cell_lib/CBDK_TSMC018_Arm_v4.0/CIC/SynopsysDC/db/tpz973gvtc.db'
    # Loading db file '/home/cell_lib/CBDK_TSMC018_Arm_v4.0/CIC/SynopsysDC/db/tpz973gvbc.db'
    # Loading db file '/usr/cad/synopsys/synthesis/cur/libraries/syn/dw_foundation.sldb'
```

## 2. Elaborate Design

```tcl
elaborate CS -architecture verilog -library CS
# design_vision> 
#     Loading db file '/usr/cad/synopsys/synthesis/cur/libraries/syn/gtech.db'
#     Loading db file '/usr/cad/synopsys/synthesis/cur/libraries/syn/standard.sldb'
#       Loading link library 'slow'
#       Loading link library 'fast'
#       Loading link library 'tpz973gvwc'
#       Loading link library 'tpz973gvtc'
#       Loading link library 'tpz973gvbc'
#       Loading link library 'gtech'
#     Running PRESTO HDLC

#     Inferred memory devices in process
#         in routine CS line 26 in file
#                 '/home/mm53/multimedia_2024_HW/SYN_HW/CS.v'.
#     ===============================================================================
#     |    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
#     ===============================================================================
#     |       X8_reg        | Flip-flop |   8   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       X9_reg        | Flip-flop |   8   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |      X1_d_reg       | Flip-flop |   8   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       X1_reg        | Flip-flop |   8   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       X2_reg        | Flip-flop |   8   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       X3_reg        | Flip-flop |   8   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       X4_reg        | Flip-flop |   8   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       X5_reg        | Flip-flop |   8   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       X6_reg        | Flip-flop |   8   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       X7_reg        | Flip-flop |   8   |  Y  | N  | Y  | N  | N  | N  | N  |
#     ===============================================================================

#     Inferred memory devices in process
#         in routine CS line 41 in file
#                 '/home/mm53/multimedia_2024_HW/SYN_HW/CS.v'.
#     ===============================================================================
#     |    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
#     ===============================================================================
#     |       S8_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       S9_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       S1_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       S2_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       S3_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       S4_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       S5_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       S6_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
#     |       S7_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
#     ===============================================================================

#     Inferred memory devices in process
#         in routine CS line 54 in file
#                 '/home/mm53/multimedia_2024_HW/SYN_HW/CS.v'.
#     ===============================================================================
#     |    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
#     ===============================================================================
#     |       Xt_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
#     ===============================================================================
#     Presto compilation completed successfully. (CS)
#     Elaborated 1 design.
#     Current design is now 'CS'.
```

## 2.1 Before Synthesis Schematic View

![image](https://github.com/freexd0m0329/Verilog/blob/main/Multimedia/SYN_HW/before_syn.png?raw=true)

## 3. Setting Design Constraints

```tcl
create_clock -name clk -period 20 -waveform {0 10} [get_ports clk]
set_dont_touch_network [get_clocks clk]
set_fix_hold [get_clocks clk]
report_clock -attribute
# design_vision> 
#     ****************************************
#     Report : clocks
#     Design : CS
#     Version: Q-2019.12
#     Date   : Wed Apr 24 20:41:45 2024
#     ****************************************

#     Attributes:
#         d - dont_touch_network
#         f - fix_hold
#         p - propagated_clock
#         G - generated_clock
#         g - lib_generated_clock

#     Clock          Period   Waveform            Attrs     Sources
#     --------------------------------------------------------------------------------
#     clk             20.00   {0 10}              d f       {clk}
#     --------------------------------------------------------------------------------

# Clock Skew
set_clock_uncertainty 0.8 [get_clocks clk]
# Source Latency
set_clock_latency -source 0 [get_clocks clk]
# Network Latency
set_clock_latency 1 [get_clocks clk]
# Clock Transition Time
set_input_transition 0.5 [all_inputs]
set_clock_transition 0.5 [all_clocks]
# DRC Rule
set_max_fanout 6 [all_inputs]
set_max_transition 0.3 [all_inputs]
set_max_area 0
```

## 4. Setting Desgin Environment

```tcl
# Set input driving for clk
set_driving_cell -library slow -lib_cell BUFX4 -pin {Y}  [get_ports clk]
# Set input driving for all input except clk
set_driving_cell -library slow -lib_cell DFFX1 -pin {Q} [remove_from_collection [all_inputs] [get_ports clk]]
# Set output load
set_load 0.001913 [all_outputs]
# Set input delay
set_input_delay -clock clk -max 1 [remove_from_collection [all_inputs] [get_clocks clk]]
set_input_delay -clock clk -min 0.2 [remove_from_collection [all_inputs] [get_clocks clk]]
# Set output delay
set_output_delay -clock clk -max 1 [all_outputs]
set_output_delay -clock clk -min 0.1 [all_outputs]
# Set wire load
set_wire_load_model -name tsmc18_wl10 -library slow
```

## 5. Check Design

```tcl
check_design -multiple_designs
# design_vision>
#     ****************************************
#     check_design summary:
#     Version:     Q-2019.12
#     Date:        Wed Apr 24 21:03:42 2024
#     ****************************************

#                     Name                                            Total
#     --------------------------------------------------------------------------------
#     Cells                                                               1
#         Cells do not drive (LINT-1)                                     1

#     Nets                                                                3
#         Unloaded nets (LINT-2)                                          3
#     --------------------------------------------------------------------------------

#     Warning: In design 'CS', cell 'B_17' does not drive any nets. (LINT-1)
#     Warning: In design 'CS', net 'net42' driven by pin 'add_23/Z_0' has no loads. (LINT-2)
#     Warning: In design 'CS', net 'net41' driven by pin 'add_23/Z_1' has no loads. (LINT-2)
#     Warning: In design 'CS', net 'net40' driven by pin 'add_23/Z_2' has no loads. (LINT-2)

uniquify
```

## 6. Report and save before Synthesis

```tcl
report_port -significant_digits 4
# design_vision>
#     Information: Updating design information... (UID-85)
#     Warning: Design 'CS' contains 1 high-fanout nets. A fanout number of 1000 will be used for delay calculations involving these nets. (TIM-134)
    
#     ****************************************
#     Report : port
#             -significant_digits  4
#     Design : CS
#     Version: Q-2019.12
#     Date   : Wed Apr 24 21:05:13 2024
#     ****************************************



#     Attributes:
#         d - dont_touch_network

#                         Pin      Wire     Max     Max     Connection
#     Port           Dir     Load     Load     Trans   Cap     Class      Attrs
#     --------------------------------------------------------------------------------
#     X[0]           in      0.0000   0.0000  0.3000  0.3115   --         
#     X[1]           in      0.0000   0.0000  0.3000  0.3115   --         
#     X[2]           in      0.0000   0.0000  0.3000  0.3115   --         
#     X[3]           in      0.0000   0.0000  0.3000  0.3115   --         
#     X[4]           in      0.0000   0.0000  0.3000  0.3115   --         
#     X[5]           in      0.0000   0.0000  0.3000  0.3115   --         
#     X[6]           in      0.0000   0.0000  0.3000  0.3115   --         
#     X[7]           in      0.0000   0.0000  0.3000  0.3115   --         
#     clk            in      0.0000   0.0000  0.3000  1.2460   --         d
#     reset          in      0.0000   0.0000  0.3000  0.3115   --         
#     Y[0]           out     0.0019   0.0000   --      --      --         
#     Y[1]           out     0.0019   0.0000   --      --      --         
#     Y[2]           out     0.0019   0.0000   --      --      --         
#     Y[3]           out     0.0019   0.0000   --      --      --         
#     Y[4]           out     0.0019   0.0000   --      --      --         
#     Y[5]           out     0.0019   0.0000   --      --      --         
#     Y[6]           out     0.0019   0.0000   --      --      --         
#     Y[7]           out     0.0019   0.0000   --      --      --         
#     Y[8]           out     0.0019   0.0000   --      --      --         
#     Y[9]           out     0.0019   0.0000   --      --      --  

# Save ddc file
write -hierarchy -format ddc -output /home/mm53/multimedia_2024_HW/SYN_HW/syn.ddc
```

## 7. Compile Design

```tcl
compile -exact_map -map_effort high -area_effort high
# design_vision>
    # Information: Evaluating DesignWare library utilization. (UISN-27)

    # ============================================================================
    # | DesignWare Building Block Library  |         Version         | Available |
    # ============================================================================
    # | Basic DW Building Blocks           | Q-2019.12-DWBB_201912.0 |     *     |
    # | Licensed DW Building Blocks        | Q-2019.12-DWBB_201912.0 |     *     |
    # ============================================================================


    # Information: There are 4 potential problems in your design. Please run 'check_design' for more information. (LINT-99)


    # Warning: IO pad 'PVSS3DGZ' is unusable: unknown logic function.  (OPT-1022)
    # Warning: IO pad 'PVSS2DGZ' is unusable: unknown logic function.  (OPT-1022)
    # Warning: IO pad 'PVSS2ANA' is unusable: unknown logic function.  (OPT-1022)
    # Warning: IO pad 'PVSS1DGZ' is unusable: unknown logic function.  (OPT-1022)
    # Warning: IO pad 'PVSS1ANA' is unusable: unknown logic function.  (OPT-1022)
    # Warning: IO pad 'PVDD2POC' is unusable: unknown logic function.  (OPT-1022)
    # Warning: IO pad 'PVDD2DGZ' is unusable: unknown logic function.  (OPT-1022)
    # Warning: IO pad 'PVDD2ANA' is unusable: unknown logic function.  (OPT-1022)
    # Warning: IO pad 'PVDD1DGZ' is unusable: unknown logic function.  (OPT-1022)
    # Warning: IO pad 'PVDD1ANA' is unusable: unknown logic function.  (OPT-1022)
    # Warning: Operating condition slow set on design CS has different process,
    # voltage and temperatures parameters than the parameters at which target library 
    # fast is characterized. Delays may be inaccurate as a result. (OPT-998)

    # Beginning Pass 1 Mapping
    # ------------------------
    # Processing 'CS'
    # Warning: The trip points for the library named tpz973gvwc differ from those in the library named slow. (TIM-164)

    # Updating timing information
    # Information: Updating design information... (UID-85)

    # Beginning Implementation Selection
    # ----------------------------------
    # Mapping 'CS_DW_cmp_0'
    # Mapping 'CS_DW_cmp_1'
    # Mapping 'CS_DW_cmp_2'
    # Mapping 'CS_DW_cmp_3'
    # Mapping 'CS_DW_cmp_4'
    # Mapping 'CS_DW_cmp_5'
    # Mapping 'CS_DW_cmp_6'
    # Mapping 'CS_DW_cmp_7'
    # Processing 'CS_DW01_sub_0'
    # Processing 'CS_DW01_sub_1'
    # Processing 'CS_DW01_sub_2'
    # Processing 'CS_DW01_sub_3'
    # Processing 'CS_DW01_sub_4'
    # Processing 'CS_DW01_sub_5'
    # Processing 'CS_DW01_sub_6'
    # Processing 'CS_DW01_sub_7'
    # Processing 'CS_DW01_sub_8'
    # Processing 'CS_DW01_add_0'
    # Processing 'CS_DW01_sub_9'
    # Processing 'CS_DW01_add_1'
    # Mapping 'CS_DW_mult_uns_0'
    # Mapping 'CS_DW_mult_uns_1'

    # Beginning Mapping Optimizations  (High effort)
    # -------------------------------
    # Information: Added key list 'DesignWare' to design 'CS'. (DDB-72)
    # Loading db file '/home/cell_lib/CBDK_TSMC018_Arm_v4.0/CIC/SynopsysDC/db/fast.db'
    # Mapping Optimization (Phase 1)

    #                                 TOTAL                                                  
    # ELAPSED            WORST NEG   SETUP    DESIGN                              MIN DELAY 
    #     TIME      AREA      SLACK     COST    RULE COST         ENDPOINT             COST    
    # --------- --------- --------- --------- --------- ------------------------- -----------
    #     0:00:09   62642.8      0.00       0.0       2.2                                0.00  
    #     0:00:09   62642.8      0.00       0.0       2.2                                0.00  
    #     0:00:09   62642.8      0.00       0.0       2.2                                0.00  
    #     0:00:09   62642.8      0.00       0.0       2.2                                0.00  
    #     0:00:09   62642.8      0.00       0.0       2.2                                0.00  
    #     0:00:10   36367.5     10.91      97.2       2.0                                0.00  
    #     0:00:11   39477.7      7.94      67.5       2.0                                0.00  
    #     0:00:11   38842.4      6.81      57.6       2.0                                0.00  
    #     0:00:11   39085.2      6.51      57.4       2.0                                0.00  
    #     0:00:11   38925.5      6.77      60.0       2.0                                0.00  
    #     0:00:11   39195.0      5.69      50.1       2.0                                0.00  
    #     0:00:12   39148.4      5.19      44.9       2.0                                0.00  
    #     0:00:12   39254.8      5.24      45.6       2.0                                0.00  
    #     0:00:12   39244.9      5.19      44.5       2.0                                0.00  
    #     0:00:12   39281.5      5.09      44.5       2.0                                0.00  
    #     0:00:12   39311.4      5.02      43.8       2.0                                0.00  
    #     0:00:12   39361.3      4.85      42.9       2.0                                0.00  
    #     0:00:12   39434.5      4.79      40.8       2.0                                0.00  
    #     0:00:12   39511.0      4.79      40.8       2.0                                0.00  
    #     0:00:12   39511.0      4.79      40.8       2.0                                0.00  
    #     0:00:12   39511.0      4.79      40.8       2.0                                0.00  
    #     0:00:12   39511.0      4.79      40.8       2.0                                0.00  
    #     0:00:12   39511.0      4.79      40.8       2.0                                0.00  
    #     0:00:12   39511.0      4.79      40.8       2.0                                0.00  
    #     0:00:12   39511.0      4.79      40.8       2.0                                0.00  
    #     0:00:13   40382.5      3.33      28.1       2.0 Y[8]                           0.00  
    #     0:00:13   41207.4      2.27      16.9       2.0 Y[8]                           0.00  
    #     0:00:14   41902.7      1.58      10.2       2.0 Y[8]                           0.00  
    #     0:00:14   42567.9      0.99       4.9       2.1 Y[8]                           0.00  
    #     0:00:15   42957.1      0.33       1.1       2.1 Y[8]                           0.00  
    #     0:00:15   43562.5      0.00       0.0       2.1                                0.00  



    # Beginning Delay Optimization Phase
    # ----------------------------------

    #                                 TOTAL                                                  
    # ELAPSED            WORST NEG   SETUP    DESIGN                              MIN DELAY 
    #     TIME      AREA      SLACK     COST    RULE COST         ENDPOINT             COST    
    # --------- --------- --------- --------- --------- ------------------------- -----------
    #     0:00:15   43562.5      0.00       0.0       2.1                                0.00  
    #     0:00:15   43562.5      0.00       0.0       2.1                                0.00  
    #     0:00:15   43562.5      0.00       0.0       2.1                                0.00  


    # Beginning Design Rule Fixing  (min_path)  (max_transition)
    # ----------------------------

    #                                 TOTAL                                                  
    # ELAPSED            WORST NEG   SETUP    DESIGN                              MIN DELAY 
    #     TIME      AREA      SLACK     COST    RULE COST         ENDPOINT             COST    
    # --------- --------- --------- --------- --------- ------------------------- -----------
    #     0:00:15   43562.5      0.00       0.0       2.1                              -28.63  
    #     0:00:15   43669.0      0.00       0.0       0.0                              -24.75  


    # Beginning Area-Recovery Phase  (max_area 0)
    # -----------------------------

    #                                 TOTAL                                                  
    # ELAPSED            WORST NEG   SETUP    DESIGN                              MIN DELAY 
    #     TIME      AREA      SLACK     COST    RULE COST         ENDPOINT             COST    
    # --------- --------- --------- --------- --------- ------------------------- -----------
    #     0:00:15   43669.0      0.00       0.0       0.0                              -24.75  
    #     0:00:15   43669.0      0.00       0.0       0.0                              -24.75  
    #     0:00:16   43216.6      0.02       0.0       0.0                              -24.75  
    #     0:00:16   43130.1      0.01       0.0       0.0                              -24.75  
    #     0:00:16   43123.4      0.01       0.0       0.0                              -24.75  
    #     0:00:16   43116.8      0.01       0.0       0.0                              -24.75  
    #     0:00:16   43110.1      0.01       0.0       0.0                              -24.75  
    #     0:00:16   43110.1      0.01       0.0       0.0                              -24.75  
    #     0:00:16   43110.1      0.00       0.0       0.0                              -24.75  
    #     0:00:16   41609.9      1.34       7.4       0.0                              -24.39  
    #     0:00:16   41407.0      1.31       7.2       0.0                              -24.39  
    #     0:00:16   41380.4      1.31       7.1       0.0                              -24.39  
    #     0:00:16   41380.4      1.31       7.1       0.0                              -24.39  
    #     0:00:16   41380.4      1.31       7.1       0.0                              -24.39  
    #     0:00:16   41380.4      1.31       7.1       0.0                              -24.39  
    #     0:00:16   41380.4      1.31       7.1       0.0                              -24.39  
    #     0:00:16   41380.4      1.31       7.1       0.0                              -24.39  
    #     0:00:17   41989.1      0.23       0.7       0.0 Y[8]                         -24.35  
    #     0:00:17   42108.9      0.00       0.0       0.0                              -24.39  
    #     0:00:17   41889.4      0.00       0.0       0.0                              -24.39  
    #     0:00:17   41859.4      0.00       0.0       0.0                              -24.39  
    #     0:00:17   41859.4      0.00       0.0       0.0                              -24.39  
    #     0:00:18   40921.4      0.95       5.3       0.0                              -24.35  
    #     0:00:18   40878.1      0.94       5.2       0.0                              -24.35  
    #     0:00:18   40878.1      0.94       5.2       0.0                              -24.35  
    #     0:00:18   40878.1      0.94       5.2       0.0                              -24.35  
    #     0:00:18   40878.1      0.94       5.2       0.0                              -24.35  
    #     0:00:18   40878.1      0.94       5.2       0.0                              -24.35  
    #     0:00:18   40878.1      0.94       5.2       0.0                              -24.35  
    #     0:00:18   41593.3      0.28       0.9       0.0 Y[7]                         -24.35  
    #     0:00:19   41982.5      0.08       0.1       0.0 Y[7]                         -24.35  
    #     0:00:19   42088.9      0.00       0.0       0.0                              -24.35  
    #     0:00:19   41942.6      0.00       0.0       0.0                              -24.26  
    #     0:00:20   41872.7      0.03       0.0       0.0                              -24.26  
    #     0:00:20   41746.3      0.00       0.0       0.0                              -24.20  
    #     0:00:20   41563.4      0.01       0.0       0.0                              -24.20  
    #     0:00:21   41496.8      0.01       0.0       0.0                              -24.20  
    #     0:00:21   41423.7      0.00       0.0       0.0                              -24.20  
    #     0:00:21   41307.2      0.01       0.0       0.0                              -24.15  
    #     0:00:22   41247.4      0.01       0.0       0.0                              -24.13  
    #     0:00:22   41174.2      0.00       0.0       0.0                              -24.11  
    #     0:00:22   41117.6      0.00       0.0       0.0                              -24.11  
    #     0:00:22   41081.0      0.00       0.0       0.0                              -24.11  
    #     0:00:22   41041.1      0.00       0.0       0.0                              -24.11  
    #     0:00:22   41041.1      0.00       0.0       0.0                              -24.11  
    #     0:00:22   41041.1      0.00       0.0       0.0                              -24.11  
    #     0:00:22   40026.6      1.00       5.8       0.0                              -23.82  
    #     0:00:22   39913.5      1.01       5.9       0.0                              -23.82  
    #     0:00:22   39903.5      1.01       6.0       0.0                              -23.82  
    #     0:00:22   39903.5      1.01       6.0       0.0                              -23.82  
    #     0:00:22   39903.5      1.01       6.0       0.0                              -23.82  
    #     0:00:22   39903.5      1.01       6.0       0.0                              -23.82  
    #     0:00:22   39903.5      1.01       6.0       0.0                              -23.82  
    #     0:00:22   39903.5      1.01       6.0       0.0                              -23.82  
    #     0:00:23   40871.5      0.42       1.9       0.0 Y[7]                         -23.82  
    #     0:00:23   41480.2      0.23       0.8       0.0 Y[7]                         -23.80  
    #     0:00:24   41733.0      0.00       0.0       0.0 X9_reg[4]/D                  -23.20  
    #     0:00:24   43263.2      0.00       0.0       0.0 S4_reg[7]/D                   -6.60  
    #     0:00:24   43981.7      0.00       0.0       0.0                                0.00  
    # Loading db file '/home/cell_lib/CBDK_TSMC018_Arm_v4.0/CIC/SynopsysDC/db/slow.db'
    # Loading db file '/home/cell_lib/CBDK_TSMC018_Arm_v4.0/CIC/SynopsysDC/db/tpz973gvwc.db'
    # Loading db file '/home/cell_lib/CBDK_TSMC018_Arm_v4.0/CIC/SynopsysDC/db/tpz973gvtc.db'
    # Loading db file '/home/cell_lib/CBDK_TSMC018_Arm_v4.0/CIC/SynopsysDC/db/tpz973gvbc.db'


    # Note: Symbol # after min delay cost means estimated hold TNS across all active scenarios 


    # Optimization Complete
    # ---------------------
```

## 7.1 After Synthesis Schematic View

![image](https://github.com/freexd0m0329/Verilog/blob/main/Multimedia/SYN_HW/after_syn.png?raw=true)

## 8. Report and save after Synthesis

```tcl
#Report Timing
report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group
# design_vision>
    # Information: Updating design information... (UID-85)
    
    # ****************************************
    # Report : timing
    #         -path full
    #         -delay max
    #         -max_paths 1
    #         -sort_by group
    # Design : CS
    # Version: Q-2019.12
    # Date   : Wed Apr 24 21:12:24 2024
    # ****************************************

    # Operating Conditions: slow   Library: slow
    # Wire Load Model Mode: top

    # Startpoint: X9_reg[1] (rising edge-triggered flip-flop clocked by clk)
    # Endpoint: Y[8] (output port clocked by clk)
    # Path Group: clk
    # Path Type: max

    # Des/Clust/Port     Wire Load Model       Library
    # ------------------------------------------------
    # CS                 tsmc18_wl10           slow

    # Point                                                   Incr       Path
    # --------------------------------------------------------------------------
    # clock clk (rise edge)                                   0.00       0.00
    # clock network delay (ideal)                             1.00       1.00
    # X9_reg[1]/CK (DFFRHQX4)                                 0.00       1.00 r
    # X9_reg[1]/Q (DFFRHQX4)                                  0.43       1.43 r
    # U676/Y (BUFX4)                                          0.27       1.70 r
    # U786/Y (INVX1)                                          0.11       1.80 f
    # U671/Y (OAI2BB1X1)                                      0.33       2.13 f
    # U674/Y (AND2X2)                                         0.29       2.42 f
    # U693/Y (AOI2BB1X2)                                      0.27       2.69 f
    # U966/Y (XOR3X2)                                         0.32       3.01 f
    # add_0_root_sub_0_root_sub_9/B[3] (CS_DW01_add_5)        0.00       3.01 f
    # add_0_root_sub_0_root_sub_9/U119/Y (OR2X2)              0.29       3.30 f
    # add_0_root_sub_0_root_sub_9/U153/Y (NAND2X1)            0.18       3.48 r
    # add_0_root_sub_0_root_sub_9/U152/Y (XOR2X1)             0.44       3.92 r
    # add_0_root_sub_0_root_sub_9/SUM[3] (CS_DW01_add_5)      0.00       3.92 r
    # U576/Y (BUFX12)                                         0.28       4.21 r
    # sub_16/A[3] (CS_DW01_sub_22)                            0.00       4.21 r
    # sub_16/U124/Y (OR2X1)                                   0.32       4.52 r
    # sub_16/U100/Y (OAI2BB1X1)                               0.32       4.85 r
    # sub_16/U101/Y (CLKINVX3)                                0.16       5.01 f
    # sub_16/U108/Y (OAI21X4)                                 0.20       5.21 r
    # sub_16/U116/Y (AOI21X2)                                 0.19       5.40 f
    # sub_16/U115/Y (OAI21X4)                                 0.24       5.64 r
    # sub_16/U97/Y (AOI21X4)                                  0.13       5.78 f
    # sub_16/U131/Y (OAI21X4)                                 0.25       6.03 r
    # sub_16/U7/Y (AOI21X4)                                   0.11       6.14 f
    # sub_16/U99/Y (XOR2X2)                                   0.28       6.41 f
    # sub_16/DIFF[11] (CS_DW01_sub_22)                        0.00       6.41 f
    # U783/Y (BUFX12)                                         0.18       6.59 f
    # U919/Y (INVXL)                                          0.19       6.78 r
    # U817/Y (BUFX3)                                          0.28       7.07 r
    # U1024/Y (NAND4X2)                                       0.20       7.27 f
    # U552/Y (AOI2BB2X4)                                      0.20       7.47 r
    # U925/Y (OAI222X2)                                       0.23       7.70 f
    # U594/Y (NAND4X4)                                        0.16       7.86 r
    # U613/Y (OAI32X2)                                        0.16       8.01 f
    # U993/Y (OAI32X4)                                        0.62       8.63 r
    # U896/Y (OR2X4)                                          0.18       8.82 r
    # U696/Y (INVX2)                                          0.09       8.91 f
    # U983/Y (NAND2BX4)                                       0.19       9.10 f
    # U650/Y (BUFX16)                                         0.18       9.28 f
    # U873/Y (OR2X4)                                          0.24       9.52 f
    # U874/Y (NAND2X4)                                        0.12       9.64 r
    # U987/Y (OR2X4)                                          0.19       9.83 r
    # U578/Y (INVX4)                                          0.05       9.88 f
    # U986/Y (OAI32X2)                                        0.38      10.26 r
    # U574/Y (INVX4)                                          0.08      10.35 f
    # U711/Y (AND2X1)                                         0.28      10.63 f
    # U899/Y (AOI2BB2X4)                                      0.25      10.88 f
    # U924/Y (OAI32X2)                                        0.23      11.11 r
    # U695/Y (OAI2BB1X2)                                      0.11      11.23 f
    # U669/Y (CLKBUFX8)                                       0.21      11.43 f
    # U637/Y (CLKINVX8)                                       0.11      11.55 r
    # U611/Y (BUFX20)                                         0.17      11.72 r
    # U590/Y (MXI2X2)                                         0.22      11.94 r
    # U629/Y (BUFX8)                                          0.17      12.11 r
    # U600/Y (NOR2BX4)                                        0.08      12.19 f
    # U913/Y (OAI32X2)                                        0.34      12.53 r
    # U973/Y (INVX4)                                          0.09      12.62 f
    # U1245/Y (AOI2BB1X2)                                     0.28      12.90 f
    # U612/Y (AOI2BB2X4)                                      0.23      13.13 f
    # U1247/Y (OAI32X2)                                       0.24      13.37 r
    # U1044/Y (OAI21X4)                                       0.15      13.51 f
    # U809/Y (BUFX12)                                         0.18      13.70 f
    # U911/Y (INVX8)                                          0.07      13.77 r
    # U955/Y (BUFX20)                                         0.17      13.94 r
    # U893/Y (MXI2X4)                                         0.19      14.13 f
    # U694/Y (AOI2BB1X2)                                      0.27      14.40 f
    # U1109/Y (OR4X2)                                         0.47      14.88 f
    # U1020/Y (OAI211X2)                                      0.17      15.05 r
    # U1021/Y (OAI211X2)                                      0.18      15.23 f
    # U1179/Y (AOI222X2)                                      0.33      15.56 r
    # U910/Y (OAI22X2)                                        0.21      15.77 f
    # U915/Y (INVX20)                                         0.32      16.09 r
    # U914/Y (MXI2X4)                                         0.21      16.30 f
    # U715/Y (NAND2X1)                                        0.32      16.62 r
    # U949/Y (OAI2BB1X2)                                      0.15      16.77 f
    # U1030/Y (OR2X4)                                         0.24      17.01 f
    # U1190/Y (OAI222X4)                                      0.46      17.47 r
    # U791/Y (XOR2X1)                                         0.37      17.84 f
    # add_23/B[8] (CS_DW01_add_4)                             0.00      17.84 f
    # add_23/U101/Y (NAND2X1)                                 0.31      18.15 r
    # add_23/U106/Y (CLKINVX3)                                0.11      18.26 f
    # add_23/U94/Y (AOI21X2)                                  0.23      18.49 r
    # add_23/U121/Y (OAI21X4)                                 0.16      18.65 f
    # add_23/U111/Y (AOI21X4)                                 0.21      18.86 r
    # add_23/U142/Y (XOR2X1)                                  0.34      19.20 r
    # add_23/SUM[11] (CS_DW01_add_4)                          0.00      19.20 r
    # Y[8] (out)                                              0.00      19.20 r
    # data arrival time                                                 19.20

    # clock clk (rise edge)                                  20.00      20.00
    # clock network delay (ideal)                             1.00      21.00
    # clock uncertainty                                      -0.80      20.20
    # output external delay                                  -1.00      19.20
    # data required time                                                19.20
    # --------------------------------------------------------------------------
    # data required time                                                19.20
    # data arrival time                                                -19.20
    # --------------------------------------------------------------------------
    # slack (MET)                                                        0.00

# Report Area
report_area
# design_vision>
#     ****************************************
#     Report : area
#     Design : CS
#     Version: Q-2019.12
#     Date   : Wed Apr 24 21:13:40 2024
#     ****************************************

#     Library(s) Used:

#         slow (File: /home/cell_lib/CBDK_TSMC018_Arm_v4.0/CIC/SynopsysDC/db/slow.db)

#     Number of ports:                          441
#     Number of nets:                          2341
#     Number of cells:                         1933
#     Number of combinational cells:           1710
#     Number of sequential cells:               200
#     Number of macros/black boxes:               0
#     Number of buf/inv:                        641
#     Number of references:                     115

#     Combinational area:              29777.933045
#     Buf/Inv area:                     7098.537682
#     Noncombinational area:           14203.728119
#     Macro/Black Box area:                0.000000
#     Net Interconnect area:          186994.278503

#     Total cell area:                 43981.661164
#     Total area:                     230975.939667

# Save Design files
write -hierarchy -format ddc -output /home/mm53/multimedia_2024_HW/SYN_HW/syn.ddc
write_sdf  -version 1.0 -context verilog chip_syn.sdf
write_sdc -version 1.7 CHIP.sdc
# Save Design as Netlist
write -hierarchy -format verilog -output /home/mm53/multimedia_2024_HW/SYN_HW/CS_compile.v
```

## 9. Pre-Layout Simulation

```bash
ncverilog testfixture.v CS_compile.v -v tsmc18.v +access+r
```

PASS test
![image](https://github.com/freexd0m0329/Verilog/blob/main/Multimedia/SYN_HW/pass_test.png?raw=true)