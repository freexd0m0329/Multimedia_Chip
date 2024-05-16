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
![image](https://github.com/freexd0m0329/Multimedia_Chip/blob/main/APR_HW/import.png?raw=true)