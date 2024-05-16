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

**Netlist block**  
Files: `CONV_scan.v`  
Top Cell: `CHIP`  
![image](https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_netlist.png?raw=true)

**Technology/Physical Libraries**  
LEF Files -> ">>" -> LEF Selection  
*Path: CBDK/CIC/SOCE/lef*  
Must add by the same order below:  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_lef.png?raw=true" width="640" alt="LEF"/>

**Floorplan and Power**  
IO Assignment File: `CONV.io`  
Power Nets: `VDD`  
Ground Nets: `VSS`  
![image](https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_fp_pg.png?raw=true)

**Analysis Configureation**  
Create Analysis Configuration..

I. Library Sets

1. Name: `lib_max`  
Timing Library Files: `slow.lib, tpz973gvwc.lib`  
*Path: CBDK/CIC/SOCE/lib*  
SI Library Files: `slow.cdB`  
*Path: CBDK/CIC/SOCE/celtic*  

2. Name: `lib_min`  
Timing Library Files: `fast.lib, tpz973gvbc.lib`  
*Path: CBDK/CIC/SOCE/lib*  
SI Library Files: `fast.cdB`  
*Path: CBDK/CIC/SOCE/celtic*  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_mmmc_lib.png?raw=true"  width="400" alt="LIB"/>

II. RC Corners

Name: `RC_corner`  
Cap Table: `tsmc018.capTbl`  
*Path: CBDK/CIC/SOCE/*  
QRC Technology File: `icecaps_5lm.tch`  
*Path: CBDK/CIC/SOCE/FireIce*  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_mmmc_RC.png?raw=true" width="400" alt="RC"/>

III. Delay Corners

1. Name: `Delay_Corner_max`  
RC Corner: `RC_corner`  
Library Set: `lib_max`  

2. Name: `Delay_Corner_min`  
RC Corner: `RC_corner`  
Library Set: `lib_min`  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_mmmc_delay.png?raw=true" width="640" alt="Delay"/>

IV. Constraint Modes

Name: `func_mode`  
SDC Constraint Files: `CONV.sdc`  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_mmmc_constraint.png?raw=true" width="400" alt="CN"/>

V. Analysis Views

1. Name: `av_func_mode_max`  
Constraint Mode: `func_mode`  
Delay Corner: `Delay_Corner_max`  

2. Name: `av_func_mode_min`  
Constraint Mode: `func_mode`  
Delay Corner: `Delay_Corner_min`  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_mmmc_av.png?raw=true" width="300" alt="AV"/>

VI. Setup Analysis Views

Analysis View: `av_func_mode_max`

VII. Hold Analysis Views

Analysis View: `av_func_mode_min`

Final Setup  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_mmmc.png?raw=true" width="640" alt="mmmc"/>

VIII. Save&Close..  
File name: `mmmc.view`  

Final Design Import Setup  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/import_final.png?raw=true" width="640" alt="import"/>  

Save...  
File name: `CHIP.globals`

## 1.1 Design Setup  

**Connect Global PG**  
Power -> Connect Global Nets..  

1. Pin Name(s): `VDD`  
To  Global Net: `VDD`  
-> Add to list  
2. Pin Name(s): `VSS`  
To Global Net: `VSS`  
-> Add to list  
-> Apply -> Check  
<img src="https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/img/place_pg.png?raw=true" width="200" alt="import"/>  

**Scan Chain**  
In terminal>  

```tcl
specifyScanChain scan1 -start ipad_SCAN_IN/C -stop opad_SCAN_OUT/I
scantrace
```
