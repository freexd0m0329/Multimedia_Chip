# APR Homework

## 0. Prepare File For Workspace

Make shure your working directory has these files:

```bash
./CONV.io                       # IO Pad
./CONV.sdc                      # Constraint
./CONV_scan.v                   # Gate-level Netlist
./addIOFiller.cmd               # From CBDK/CIC/SOCE
./addbonding_for_t18_v3.pl      # From CBDK/CIC/SOCE/bond_pads
./io.list                       # Rename From CBDK/CIC/SOCE/bond_pads/io_t18.list
./streamOut.map                 # From CBDK/CIC/SOCE
./DRC/CLM18_LM16_6M.28a_m.drc   # From CBDK/CIC/Calibre/drc
./LVS/Calibre.lvs               # From CBDK/CIC/Calibre/lvs
./LVS/Calibre-lvs-cur           # From CBDK/CIC/Calibre/lvs
./LVS/tpz973gv_lvs.spi          # From CBDK/CIC/Calibre/lvs
./LVS/tpz973gv_lvs.v            # From CBDK/CIC/Calibre/lvs
./LVS/tsmc18_lvs.spi            # From CBDK/CIC/Calibre/lvs
./LVS/tsmc18_lvs.v              # From CBDK/CIC/Calibre/lvs
```

## 1. Import Design

Open Innovus in terminal

```bash
innovus
```

File -> Import Design..  
![image](https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import.png?raw=true)

### Netlist block

Files: `CONV_scan.v`  
Top Cell: `CHIP`  
![image](https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_netlist.png?raw=true)

### Technology/Physical Libraries

LEF Files -> ">>" -> LEF Selection  
*Path: CBDK/CIC/SOCE/lef*  
Must add by the same order below:  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_lef.png?raw=true" width="640" alt="LEF"/>

### Floorplan and Power

IO Assignment File: `CONV.io`  
Power Nets: `VDD`  
Ground Nets: `VSS`  
![image](https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_fp_pg.png?raw=true)

### Analysis Configureation

Create Analysis Configuration..

#### I. Library Sets

1. Name: `lib_max`  
Timing Library Files: `slow.lib, tpz973gvwc.lib`  
*Path: CBDK/CIC/SOCE/lib*  
SI Library Files: `slow.cdB`  
*Path: CBDK/CIC/SOCE/celtic*  

1. Name: `lib_min`  
Timing Library Files: `fast.lib, tpz973gvbc.lib`  
*Path: CBDK/CIC/SOCE/lib*  
SI Library Files: `fast.cdB`  
*Path: CBDK/CIC/SOCE/celtic*  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_mmmc_lib.png?raw=true"  width="400" alt="LIB"/>

#### II. RC Corners

Name: `RC_corner`  
Cap Table: `tsmc018.capTbl`  
*Path: CBDK/CIC/SOCE/*  
QRC Technology File: `icecaps_5lm.tch`  
*Path: CBDK/CIC/SOCE/FireIce*  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_mmmc_RC.png?raw=true" width="400" alt="RC"/>

#### III. Delay Corners

1. Name: `Delay_Corner_max`  
RC Corner: `RC_corner`  
Library Set: `lib_max`  

2. Name: `Delay_Corner_min`  
RC Corner: `RC_corner`  
Library Set: `lib_min`  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_mmmc_delay.png?raw=true" width="640" alt="Delay"/>

#### IV. Constraint Modes

Name: `func_mode`  
SDC Constraint Files: `CONV.sdc`  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_mmmc_constraint.png?raw=true" width="400" alt="CN"/>

#### V. Analysis Views

1. Name: `av_func_mode_max`  
Constraint Mode: `func_mode`  
Delay Corner: `Delay_Corner_max`  

2. Name: `av_func_mode_min`  
Constraint Mode: `func_mode`  
Delay Corner: `Delay_Corner_min`  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_mmmc_av.png?raw=true" width="300" alt="AV"/>

#### VI. Setup Analysis Views

Analysis View: `av_func_mode_max`

#### VII. Hold Analysis Views

Analysis View: `av_func_mode_min`

Final Setup  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_mmmc.png?raw=true" width="640" alt="mmmc"/>

#### VIII. Save & Close

File name: `mmmc.view`  

Final Design Import Setup  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_final.png?raw=true" width="640" alt="import"/>  

Save...  
File name: `CHIP.globals`

## 1.1 Design Setup  

### I. Connect Global PG

Power -> Connect Global Nets..  

1. Pin Name(s): `VDD`  
To  Global Net: `VDD`  
-> Add to list  
2. Pin Name(s): `VSS`  
To Global Net: `VSS`  
-> Add to list  
-> Apply -> Check  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/place_pg.png?raw=true" width="200" alt="import"/>  

### II. Scan Chain

```tcl
innovus 1> specifyScanChain scan1 -start ipad_SCAN_IN/C -stop opad_SCAN_OUT/I
innovus 2> scantrace
```

## 2. Floorplan

### I. Specify Floorplan

Floorplan -> Specify Floorplan...  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/fp.png?raw=true" width="200" alt="fp"/>  
Ratio(H/W): `1`  
Core Utilization: `0~1` (typical 0.5)  
Core to Left/Top/Right/Bottom: `121`  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/fp_fp.png?raw=true" width="640" alt="fp_fp"/>  
The distance of pad should 12um at least.  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/fp_120.png?raw=true" width="400" alt="fp_120"/>

### II. Placement in Floorplan Mode

Place -> Place Standard Cell... -> Run Placement In Floorplan Mode  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/fp_place.png?raw=true" width="640" alt="fp_place"/>  
On the top of right corner, switch to Physical View  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/fp_phy.png?raw=true" width="100" alt="fp_phy"/>  
Design Area should be..  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/fp_place_phy.png?raw=true" width="640" alt="fp_place_phy"/>  

### III. Timing Analysis

```tcl
innovus 3> createBasicPathGroups -expanded
innovus 4> setPlaceMode -place_design_floorplan_mode false
innovus 5> timeDesign -preCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_preCTS -outDir timingReports
```

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/fp_pre_timing.png?raw=true" width="640" alt="fp_pre_timing"/>

If the timing does not meet the slack (WNS), execute timing optimization.

### IV. Timing Optimization

ECO -> Optimized Design... -> Pre-CTS -> Check "Max Fanout"

```tcl
innovus 6> timeDesign -preCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_preCTS -outDir timingReports
```

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/fp_post_timing.png?raw=true" width="640" alt="fp_post_timing"/>

### V. Save Design

File -> Save Design -> Innovus  
File Name: `floorplan.enc`

## 3. Powerplan

### Refine Placement

When doing timing analysis, innovus will use trail route to help analysis. Remove it to avoid unknown errors.  

Place -> Refine Placement... -> Mode -> Uncheck Preserve Routing  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/refine.png?raw=true" width="640" alt="refine"/>  

### I. Power Ring

Power -> Power Planning -> Add Ring  

**Basic**  
Net(s): `VDD VSS`  
Top/Bottom/Left/Right Width: `5`  
Top/Bottom/Left/Right Spacing: `0.28`  
Check Offset: Center in channel

**Advanced**  
Check Wire Group  
Number of bits: `4`  
Check Interleaving  

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/power_ring.png?raw=true" width="640" alt="power_ring"/>  

### II. Pad Pins

Route -> Special Route...  

**Basic**  
Net(s): `VDD VSS`
In SRoute block:  
Uncheck everything except Pad Pins

**Advanced**  
Select Pad Pins  
In Number of Connecions to Multiple Geometries:  
Select `All`  

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/power_pad.png?raw=true" width="640" alt="power_pad"/>  

### III. Power Stripe

 Power -> Power Planning -> Add Stripe...  

**Basic**  
Net(s): `VDD VSS`  
Layer: `METAL 4`  
Width: `4`  
Spacing: `0.28`  
Set-to-set distance: `60`  
Relative from core or selected area Start: `50` Stop: `50`

**Advanced**  
Check Switch layer over obstructions  
Check Merge with block rings if spacing less than: `0.56`  
Maximum length of same layer job: `0.56`  
Check Wire Group  
Check Interleaving  
Number of bits: `3`

**Mode**  
Check Split vias while encountering Obs and different net Wires/Pins  

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/power_stripe.png?raw=true" width="640" alt="power_stripe"/>  

**Change following setup and repeate again for Horizontal Power Stripe.**  
Layer: `METAL 5`  
Relative from core or selected area Start: `50` Stop: `100`

Design Area should be..  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/power.png?raw=true" width="640" alt="power"/>  

### IV. Save

File -> Save Design -> Innovus  
File Name: `powerplan.enc`

## 3. Placement

## I. Full Placement

Place -> Place Standard Cell...  
Select `Run Full Placement`  

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/place_full.png?raw=true" width="400" alt="place_full"/>  

## II. Check Placement

Place -> Check Placement...  

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/place_check.png?raw=true" width="400" alt="place_check"/>  

### III. & IV. Timing Analysis and Optimization

Same step as 2-III and 2-IV.

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/place_timing.png?raw=true" width="400" alt="place_timing"/>  

### V. Refine Placement

Place -> Refine Placement... -> Mode -> Uncheck Preserve Routing  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/refine.png?raw=true" width="640" alt="refine"/>  

### VI. Follow Pins

Route -> Special Route...

**Basic**  
Net(s): `VDD VSS`  
In SRoute block:  
Uncheck everything except Follow Pins

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/place_follow.png?raw=true" width="400" alt="place_follow"/>  

### VII. Check and Verify

Verify -> Verify Connectivity...

Select `Special Only`  
Named: `VDD VSS`  
Uncheck Soft PG Connect

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/place_verify.png?raw=true" width="640" alt="place_verify"/>  

### VIII. IO Filler

```tcl
source addIoFiller.cmd
```

### IX. Save DEF and Routing Blockage

Save routing information for blockage script.  
File -> Save -> DEF...

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/place_def.png?raw=true" width="400" alt="place_def"/>  

Run routing blockage script.  

```tcl
perl ./addbonding_for_t18_v3.pl CHIP.def
source addRouteBlk.cmd
```

File -> Save Design -> Innovus  
File Name: `place_CUPPad.enc`

Design Area should be..  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/place.png?raw=true" width="640" alt="place"/>  

## 4. CTS

### I. Add Clock Tree

```tcl
ccopt_design -cts
```

### II. & III. Timing Analysis and Optimization

Same step as 2-III and 2-IV.  
But change to `Post-CTS` and run both `Setup` and `Hold`.

```tcl
timeDesign -postCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_postCTS -outDir timingReports
timeDesign -postCTS -hold -pathReports -slackReports -numPaths 50 -prefix CHIP_postCTS -outDir timingReports
```

### IV. Add Tie Hi/Lo

Place -> Tie Hi/Lo Cell -> Add... -> Mode  

Cell Name(s) -> Select `TIEHI TIELO`  
Check Specify Maximum Fanout: `20`  
Check Specify Maximum Distance: `100`

Up to the circumstances there may be 0.  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/place_tiehi.png?raw=true" width="640" alt="place_tiehi"/>

### V. Save

File -> Save Design -> Innovus  
File Name: `cts_hilo.enc`

Design Area should be..  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/cts.png?raw=true" width="640" alt="cts"/>  

## 5. Routing

### I. Routing

Route -> NanoRoute -> Route...  

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/route.png?raw=true" width="640" alt="route"/>

### II. III. Timing Analysis and Optimization

Same step as 2-III and 2-IV.  
But change to `Post-Route` and run both `Setup` and `Hold`.

```tcl
setAnalysisMode -analysisType onChipVariation
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_postRoute -outDir timingReports
timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix CHIP_postRoute -outDir timingReports
```

### IV. Add Filler

Place -> Physical Cell -> Add Filler...  
Cell Name(s) -> Select `Fill1 Fill16 Fill2 Fill32 Fill4 Fill64 Fill8`  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/route_filler.png?raw=true" width="640" alt="route_filler"/>

### V. Verify DRC and Save

Verify -> Verify DRC...  

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/route_drc.png?raw=true" width="640" alt="route_drc"/>  

File -> Save Design -> Innovus  
File Name: `Corefiller.enc`

### VI. Metal Fill and Save

Route -> Metal Fill -> Setup...  

**Windows&Density**  
METAL1/2/3/4/5 Max: `50`  

Route -> Metal Fill -> Add...  
Uncheck Tie High/Low to Net(s)  
Check Critical Nets from Timing Analysis: `0.4`  

File -> Save Design -> Innovus  
File Name: `metalfill.enc`

### VII. Verify

Verify -> Verify DRC...  

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/route_drc.png?raw=true" width="640" alt="route_drc"/>  

Verify -> Verify Connectivity...  
In Net Type Select `All`  
In Nets Select `All`  

Verify -> Verify Process Antenna...

<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/verify.png?raw=true" width="640" alt="verify"/>  

If there has violation, run optimized or ECO route or fall back to placement.

### VIII. Export Design and add Bounding Pads

**Save Netlist**  

File -> Save -> Netlist  
Netlist File: `CHIP.v`

**Save sdf**  

```tcl
setAnalysisMode -analysisType bcwc
write_sdf -max_view av_func_mode_max -min_view av_func_mode_min -edges noedge  -splitsetuphold -remashold -splitrecrem -min_period_edges none CHIP.sdf
```

**Save def**  

File -> Save -> DEF...  
Check `Save Scan`

**Add Bounding Pads**  

```tcl
source addbond.cmd
```

**Add Text**  

In Design Area, find IOVDD pad pin and use mouse point on it. Check the coordinate at right down corner.  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/vdd.png?raw=true" width="200" alt="vdd"/>  

```tcl
add_text -layer METAL5 -label IOVDD -pt 68 1645 -height 10
add_text -layer METAL5 -label IOVSS -pt 68 1734 -height 10
```

**Save GDS**  

Tools -> Set Modes -> Mode Setup...  
Select `StreamOut`  
Uncheck `Virtual Connection`

File -> Save -> GDS/OASIS...  
Output File: `CHIP.gds`  
Map File: `streamOut.map`  
Check Merge Files: `tpb973gv.gds`  
*Path: CBDK/CIC/SOCE/Phantom*  
Check Write abstract information for LEF Macros  
Units: `1000`  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/gds.png?raw=true" width="200" alt="gds"/>  

Redo this step for 2-times and select different Merge Files: `tsmc18_core.gds tsmc18_io.gds`  

File -> Save Design -> Innovus  
File Name: `final.enc`

And the final Design Area  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/final.png?raw=true" width="200" alt="final"/>  
