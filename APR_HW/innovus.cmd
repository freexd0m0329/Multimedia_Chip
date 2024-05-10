#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Wed May  8 21:20:58 2024                
#                                                     
#######################################################

#@(#)CDS: Innovus v19.12-s087_1 (64bit) 11/11/2019 17:32 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 19.12-s087_1 NR191024-1807/19_12-UB (database version 18.20, 485.7.1) {superthreading v1.51}
#@(#)CDS: AAE 19.12-s033 (64bit) 11/11/2019 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 19.12-s033_1 () Oct 24 2019 14:09:28 ( )
#@(#)CDS: SYNTECH 19.12-s008_1 () Oct  6 2019 23:25:36 ( )
#@(#)CDS: CPE v19.12-s079
#@(#)CDS: IQuantus/TQuantus 19.1.3-s095 (64bit) Fri Aug 30 18:16:09 PDT 2019 (Linux 2.6.32-431.11.2.el6.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_gnd_net VSS
set init_lef_file {../../cell_lib/CBDK_TSMC018_Arm_v3.2/CIC/SOCE/lef/tsmc18_6lm_cic.lef ../../cell_lib/CBDK_TSMC018_Arm_v3.2/CIC/SOCE/lef/tpb973gv_6lm.lef ../../cell_lib/CBDK_TSMC018_Arm_v3.2/CIC/SOCE/lef/tpz973gv_6lm_cic.lef ../../cell_lib/CBDK_TSMC018_Arm_v3.2/CIC/SOCE/lef/antenna.lef ../../cell_lib/CBDK_TSMC018_Arm_v3.2/CIC/SOCE/lef/tsmc18_6lm_antenna_cic.lef}
set init_verilog CONV_scan.v
set init_mmmc_file mmmc.view
set init_io_file CONV.io
set init_top_cell CHIP
set init_pwr_net VDD
init_design
setDrawView fplan
clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -instanceBasename *
globalNetConnect VSS -type pgpin -pin VSS -instanceBasename *
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site tsm3site -r 1 0.05 121 121 121 121
uiSetTool select
getIoFlowFlag
fit
::mp::clearAllSeed
setPlanDesignMode -effort high -incremental false -boundaryPlace true -fixPlacedMacros false -noColorize false
planDesign
setMultiCpuUsage -localCpu 10 -cpuPerRemoteHost 1 -remoteHost 0 -keepLicense true
setDistributeHost -local
setRouteMode -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -droutePostRouteSpreadWire 1
setNanoRouteMode -quiet -timingEngine {}
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X1 DLY3X1 DLY2X1 DLY1X1 CLKBUFXL CLKBUFX8 CLKBUFX4 CLKBUFX3 CLKBUFX20 CLKBUFX2 CLKBUFX16 CLKBUFX12 CLKBUFX1 BUFXL BUFX8 BUFX4 BUFX3 BUFX20 BUFX2 BUFX16 BUFX12 BUFX1 INVXL INVX8 INVX4 INVX3 INVX20 INVX2 INVX16 INVX12 INVX1 CLKINVXL CLKINVX8 CLKINVX4 CLKINVX3 CLKINVX20 CLKINVX2 CLKINVX16 CLKINVX12 CLKINVX1} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -fp true -timingDriven 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 0 -placeIOPins 0 -moduleAwareSpare 0 -maxDensity 0.1 -preserveRouting 1 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setPlaceMode -fp true
place_design
setDrawView place
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -preCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_preCTS -outDir timingReports
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -preCTS
setPlaceMode -place_design_floorplan_mode false
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -preCTS
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -preCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_preCTS -outDir timingReports
createBasicPathGroups -expanded
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -preCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_preCTS -outDir timingReports
saveDesign floorplan.enc
refinePlace -checkRoute 0 -preserveRouting 0 -rmAffectedRouting 0 -swapEEQ 0
getCTSMode -engine -quiet
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
getCTSMode -engine -quiet
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer METAL5 -stacked_via_bottom_layer METAL1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top METAL1 bottom METAL1 left METAL2 right METAL2} -width {top 5 bottom 5 left 5 right 5} -spacing {top 0.28 bottom 0.28 left 0.28 right 0.28} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None -use_wire_group 1 -use_wire_group_bits 4 -use_interleaving_wire_group 1
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { padPin } -layerChangeRange { METAL1(1) METAL5(5) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort allGeom } -padPinTarget { nearestTarget } -allowJogging 1 -crossoverViaLayerRange { METAL1(1) METAL5(5) } -nets { VDD VSS } -allowLayerChange 1 -targetViaLayerRange { METAL1(1) METAL5(5) }
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer METAL5 -stacked_via_bottom_layer METAL1 -via_using_exact_crossover_size false -split_vias true -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {VDD VSS} -layer METAL4 -direction vertical -width 4 -spacing 0.28 -set_to_set_distance 60 -start_from left -start_offset 50 -stop_offset 50 -switch_layer_over_obs true -merge_stripes_value 0.56 -max_same_layer_jog_length 0.56 -padcore_ring_top_layer_limit METAL5 -padcore_ring_bottom_layer_limit METAL1 -block_ring_top_layer_limit METAL5 -block_ring_bottom_layer_limit METAL1 -use_wire_group 1 -use_interleaving_wire_group 1 -use_wire_group_bits 3 -snap_wire_center_to_grid None
getCTSMode -engine -quiet
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer METAL5 -stacked_via_bottom_layer METAL1 -via_using_exact_crossover_size false -split_vias true -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {VDD VSS} -layer METAL5 -direction horizontal -width 4 -spacing 0.28 -set_to_set_distance 60 -start_from bottom -start_offset 50 -stop_offset 100 -switch_layer_over_obs true -merge_stripes_value 0.56 -max_same_layer_jog_length 0.56 -padcore_ring_top_layer_limit METAL5 -padcore_ring_bottom_layer_limit METAL1 -block_ring_top_layer_limit METAL5 -block_ring_bottom_layer_limit METAL1 -use_wire_group 1 -use_interleaving_wire_group 1 -use_wire_group_bits 3 -snap_wire_center_to_grid None
zoomBox 654.60200 1272.90000 2544.67300 3241.04600
zoomBox 1084.30900 2060.83350 2070.93800 3088.21850
zoomBox 1214.60550 2299.28000 1927.44550 3041.56600
zoomBox 1345.65550 2538.83900 1783.42850 2994.69550
zoomBox 1426.57200 2684.64950 1695.42000 2964.60300
fit
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol false -sameCellViol true -padFillerCellsOverlap true -routingBlkgPinOverlap false -routingCellBlkgOverlap false -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
saveDesign powerplan.enc
setRouteMode -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
setEndCapMode -reset
setEndCapMode -boundary_tap false
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {BUFX1 BUFX12 BUFX16 BUFX2 BUFX20 BUFX3 BUFX4 BUFX8 BUFXL CLKBUFX1 CLKBUFX12 CLKBUFX16 CLKBUFX2 CLKBUFX20 CLKBUFX3 CLKBUFX4 CLKBUFX8 CLKBUFXL DLY1X1 DLY2X1 DLY3X1 DLY4X1 CLKINVX1 CLKINVX12 CLKINVX16 CLKINVX2 CLKINVX20 CLKINVX3 CLKINVX4 CLKINVX8 CLKINVXL INVX1 INVX12 INVX16 INVX2 INVX20 INVX3 INVX4 INVX8 INVXL} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort medium -timingDriven 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 0 -placeIOPins 0 -moduleAwareSpare 0 -maxDensity 0.1 -preserveRouting 1 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setPlaceMode -fp false
place_design
setPlaceMode -fp false
place_design
setRouteMode -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
setEndCapMode -reset
setEndCapMode -boundary_tap false
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X1 DLY3X1 DLY2X1 DLY1X1 CLKBUFXL CLKBUFX8 CLKBUFX4 CLKBUFX3 CLKBUFX20 CLKBUFX2 CLKBUFX16 CLKBUFX12 CLKBUFX1 BUFXL BUFX8 BUFX4 BUFX3 BUFX20 BUFX2 BUFX16 BUFX12 BUFX1 INVXL INVX8 INVX4 INVX3 INVX20 INVX2 INVX16 INVX12 INVX1 CLKINVXL CLKINVX8 CLKINVX4 CLKINVX3 CLKINVX20 CLKINVX2 CLKINVX16 CLKINVX12 CLKINVX1} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort medium -timingDriven 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 0 -placeIOPins 0 -moduleAwareSpare 0 -maxDensity 0.15 -preserveRouting 1 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setPlaceMode -fp false
place_design
specifyScanChain scan1 -start ipad_SCAN_IN/C -stop opad_SCAN_OUT/I
scanTrace
setPlaceMode -fp false
place_design
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -preCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_preCTS -outDir timingReports
getCTSMode -engine -quiet
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -preCTS
checkPlace CHIP.checkPlace
setDrawView place
fit
getCTSMode -engine -quiet
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -preCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_preCTS -outDir timingReports
refinePlace -checkRoute 0 -preserveRouting 0 -rmAffectedRouting 0 -swapEEQ 0
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { corePin } -layerChangeRange { METAL1(1) METAL5(5) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { METAL1(1) METAL5(5) } -nets { VDD VSS } -allowLayerChange 1 -targetViaLayerRange { METAL1(1) METAL5(5) }
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol false -sameCellViol true -padFillerCellsOverlap true -routingBlkgPinOverlap false -routingCellBlkgOverlap false -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
verifyConnectivity -nets {VDD VSS} -type special -noSoftPGConnect -error 1000 -warning 50
addIoFiller -cell PFILLER20 -prefix IOFILLER
addIoFiller -cell PFILLER10 -prefix IOFILLER
addIoFiller -cell PFILLER5 -prefix IOFILLER
addIoFiller -cell PFILLER1 -prefix IOFILLER
addIoFiller -cell PFILLER05 -prefix IOFILLER
addIoFiller -cell PFILLER0005 -prefix IOFILLER -fillAnyGap
redraw
saveDesign place_IoFiller.enc
set dbgLefDefOutVersion 5.8
global dbgLefDefOutVersion
set dbgLefDefOutVersion 5.8
defOut -floorplan -netlist CHIP.def
set dbgLefDefOutVersion 5.8
set dbgLefDefOutVersion 5.8
createRouteBlk -box 0 0 185 3289.64 -layer 5 -name IORouteblk_W
createRouteBlk -box 0 0 3291.62 185 -layer 5 -name IORouteblk_S
createRouteBlk -box 0 3104.64 3291.62 3289.64 -layer 5 -name IORouteblk_N
createRouteBlk -box 3106.62 0 3291.62 3289.64 -layer 5 -name IORouteblk_E
setDrawView place
redraw
setLayerPreference node_blockage -isVisible 1
setLayerPreference node_blockage -isVisible 0
saveDesign place_CUPPad.enc
ccopt_design -cts
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_postCTS -outDir timingReports
getCTSMode -engine -quiet
getCTSMode -engine -quiet
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postCTS
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_postCTS -outDir timingReports
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postCTS -hold -pathReports -slackReports -numPaths 50 -prefix CHIP_postCTS -outDir timingReports
saveDesign cts.enc
setRouteMode -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
setEndCapMode -reset
setEndCapMode -boundary_tap false
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {BUFX1 BUFX12 BUFX16 BUFX2 BUFX20 BUFX3 BUFX4 BUFX8 BUFXL CLKBUFX1 CLKBUFX12 CLKBUFX16 CLKBUFX2 CLKBUFX20 CLKBUFX3 CLKBUFX4 CLKBUFX8 CLKBUFXL DLY1X1 DLY2X1 DLY3X1 DLY4X1 CLKINVX1 CLKINVX12 CLKINVX16 CLKINVX2 CLKINVX20 CLKINVX3 CLKINVX4 CLKINVX8 CLKINVXL INVX1 INVX12 INVX16 INVX2 INVX20 INVX3 INVX4 INVX8 INVXL} -maxAllowedDelay 1
setTieHiLoMode -reset
setTieHiLoMode -cell {  TIEHI TIELO } -maxDistance 100 -maxFanOut 20 -honorDontTouch false -createHierPort false
addTieHiLo -cell {TIEHI TIELO} -prefix LTIE
saveDesign cts_hilo.enc
setAttribute -net CONV/CTS_2 -weight 10 -preferred_extra_space 1
setAttribute -net CONV/CTS_1 -weight 10 -preferred_extra_space 1
setAttribute -net CONV/CTS_5 -weight 10 -preferred_extra_space 1
setAttribute -net CONV/CTS_4 -weight 10 -preferred_extra_space 1
setAttribute -net clk -weight 10 -preferred_extra_space 1
setAttribute -net i_clk -weight 10 -preferred_extra_space 1
setNanoRouteMode -quiet -routeInsertAntennaDiode 1
setNanoRouteMode -quiet -routeAntennaCellName ANTENNA
setNanoRouteMode -quiet -routeWithTimingDriven 1
setNanoRouteMode -quiet -routeWithSiDriven 1
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
routeDesign -globalDetail -viaOpt -wireOpt
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol false -sameCellViol true -padFillerCellsOverlap true -routingBlkgPinOverlap false -routingCellBlkgOverlap false -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol true -padFillerCellsOverlap true -routingBlkgPinOverlap false -routingCellBlkgOverlap false -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
getNanoRouteMode -quiet -routeWithTimingDriven
setSIMode -acceptableWNS same -fixDRC 1 -fixHoldIncludeXtalkSetup 0
setOptMode -fixCap false -fixTran false -fixFanoutLoad false
setDelayCalMode -engine default -siAware true
optDesign -postRoute -incr
setAnalysisMode -analysisType onChipVariation
setOptMode -fixCap false -fixTran false -fixFanoutLoad false
setDelayCalMode -engine default -siAware true
optDesign -postRoute -incr
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol true -padFillerCellsOverlap true -routingBlkgPinOverlap false -routingCellBlkgOverlap false -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_postRoute -outDir timingReports
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix CHIP_postRoute -outDir timingReports
saveDesign route.enc
getFillerMode -quiet
addFiller -cell FILL1 FILL16 FILL2 FILL32 FILL4 FILL64 FILL8 -prefix FILLER
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol true -padFillerCellsOverlap true -routingBlkgPinOverlap false -routingCellBlkgOverlap false -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
saveDesign Corefiller.enc
setMetalFill -layer METAL1 -opcActiveSpacing 0.230 -maxDensity 50
setMetalFill -layer METAL2 -opcActiveSpacing 0.280 -maxDensity 50
setMetalFill -layer METAL3 -opcActiveSpacing 0.280 -maxDensity 50
setMetalFill -layer METAL4 -opcActiveSpacing 0.280 -maxDensity 50
setMetalFill -layer METAL5 -opcActiveSpacing 0.280 -maxDensity 50
verifyConnectivity -type all -noSoftPGConnect -error 1000 -warning 50
verifyProcessAntenna -report CHIP.antenna.rpt -error 1000
setNanoRouteMode -quiet -routeWithEco 1
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
routeDesign -globalDetail -viaOpt -wireOpt
verifyProcessAntenna -report CHIP.antenna.rpt -error 1000
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol true -padFillerCellsOverlap true -routingBlkgPinOverlap false -routingCellBlkgOverlap false -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
setRouteMode -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
setEndCapMode -reset
setEndCapMode -boundary_tap false
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X1 DLY3X1 DLY2X1 DLY1X1 CLKBUFXL CLKBUFX8 CLKBUFX4 CLKBUFX3 CLKBUFX20 CLKBUFX2 CLKBUFX16 CLKBUFX12 CLKBUFX1 BUFXL BUFX8 BUFX4 BUFX3 BUFX20 BUFX2 BUFX16 BUFX12 BUFX1 INVXL INVX8 INVX4 INVX3 INVX20 INVX2 INVX16 INVX12 INVX1 CLKINVXL CLKINVX8 CLKINVX4 CLKINVX3 CLKINVX20 CLKINVX2 CLKINVX16 CLKINVX12 CLKINVX1} -maxAllowedDelay 1
setTieHiLoMode -reset
setTieHiLoMode -cell {{TIEHI TIELO}} -maxDistance 100 -maxFanOut 20 -honorDontTouch false -createHierPort false
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
routeDesign -globalDetail -viaOpt -wireOpt
verifyProcessAntenna -report CHIP.antenna.rpt -error 1000
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol true -padFillerCellsOverlap true -routingBlkgPinOverlap false -routingCellBlkgOverlap false -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
setRouteMode -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -routeWithEco false
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {BUFX1 BUFX12 BUFX16 BUFX2 BUFX20 BUFX3 BUFX4 BUFX8 BUFXL CLKBUFX1 CLKBUFX12 CLKBUFX16 CLKBUFX2 CLKBUFX20 CLKBUFX3 CLKBUFX4 CLKBUFX8 CLKBUFXL DLY1X1 DLY2X1 DLY3X1 DLY4X1 CLKINVX1 CLKINVX12 CLKINVX16 CLKINVX2 CLKINVX20 CLKINVX3 CLKINVX4 CLKINVX8 CLKINVXL INVX1 INVX12 INVX16 INVX2 INVX20 INVX3 INVX4 INVX8 INVXL} -maxAllowedDelay 1
setTieHiLoMode -reset
setTieHiLoMode -cell {{TIEHI TIELO}} -maxDistance 100 -maxFanOut 20 -honorDontTouch false -createHierPort false
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
routeDesign -globalDetail -viaOpt -wireOpt
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol true -padFillerCellsOverlap true -routingBlkgPinOverlap false -routingCellBlkgOverlap false -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
verifyConnectivity -type all -noSoftPGConnect -error 1000 -warning 50
getCTSMode -engine -quiet
addMetalFill -layer { METAL1 METAL2 METAL3 METAL4 METAL5 } -timingAware sta -slackThreshold 0.4
saveDesign metalfill.enc
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol true -padFillerCellsOverlap true -routingBlkgPinOverlap false -routingCellBlkgOverlap false -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
verifyConnectivity -type all -noSoftPGConnect -error 1000 -warning 50
verifyProcessAntenna -report CHIP.antenna.rpt -error 1000
saveNetlist CHIP.v
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_postRoute -outDir timingReports
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix CHIP_postRoute -outDir timingReports
setAnalysisMode -analysisType bcwc
write_sdf -max_view av_func_mode_max -min_view av_func_mode_min -edges noedge  -splitsetuphold -remashold -splitrecrem -min_period_edges none  CHIP.sdf
set dbgLefDefOutVersion 5.8
global dbgLefDefOutVersion
set dbgLefDefOutVersion 5.8
defOut -floorplan -netlist -scanChain -routing CHIP.def
set dbgLefDefOutVersion 5.8
set dbgLefDefOutVersion 5.8
addInst -physical -cell PAD60GU -inst BPad_west1 -loc 0 234.72 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west2 -loc 0 314.44 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west3 -loc 0 394.16 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west4 -loc 0 473.88 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west5 -loc 0 553.6 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west6 -loc 0 633.32 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west7 -loc 0 713.04 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west8 -loc 0 792.76 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west9 -loc 0 872.48 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west10 -loc 0 952.2 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west11 -loc 0 1031.92 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west12 -loc 0 1111.64 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west13 -loc 0 1191.36 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west14 -loc 0 1271.08 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west15 -loc 0 1350.8 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west16 -loc 0 1430.52 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west17 -loc 0 1510.24 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west18 -loc 0 1589.96 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west19 -loc 0 1669.68 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west20 -loc 0 1749.4 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west21 -loc 0 1829.12 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west22 -loc 0 1908.84 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west23 -loc 0 1988.56 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west24 -loc 0 2068.28 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west25 -loc 0 2148 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west26 -loc 0 2227.72 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west27 -loc 0 2307.44 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west28 -loc 0 2387.16 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west29 -loc 0 2466.88 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west30 -loc 0 2546.6 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west31 -loc 0 2626.32 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west32 -loc 0 2706.04 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west33 -loc 0 2785.76 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west34 -loc 0 2865.48 -ori R270
addInst -physical -cell PAD60GU -inst BPad_west35 -loc 0 2945.2 -ori R270
addInst -physical -cell PAD60NU -inst BPad_west36 -loc 0 3024.92 -ori R270
addInst -physical -cell PAD60NU -inst BPad_east1 -loc 3119.39 234.72 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east2 -loc 3204.39 314.44 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east3 -loc 3119.39 394.16 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east4 -loc 3204.39 473.88 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east5 -loc 3119.39 553.6 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east6 -loc 3204.39 633.32 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east7 -loc 3119.39 713.04 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east8 -loc 3204.39 792.76 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east9 -loc 3119.39 872.48 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east10 -loc 3204.39 952.2 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east11 -loc 3119.39 1031.92 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east12 -loc 3204.39 1111.64 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east13 -loc 3119.39 1191.36 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east14 -loc 3204.39 1271.08 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east15 -loc 3119.39 1350.8 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east16 -loc 3204.39 1430.52 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east17 -loc 3119.39 1510.24 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east18 -loc 3204.39 1589.96 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east19 -loc 3119.39 1669.68 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east20 -loc 3204.39 1749.4 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east21 -loc 3119.39 1829.12 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east22 -loc 3204.39 1908.84 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east23 -loc 3119.39 1988.56 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east24 -loc 3204.39 2068.28 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east25 -loc 3119.39 2148 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east26 -loc 3204.39 2227.72 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east27 -loc 3119.39 2307.44 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east28 -loc 3204.39 2387.16 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east29 -loc 3119.39 2466.88 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east30 -loc 3204.39 2546.6 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east31 -loc 3119.39 2626.32 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east32 -loc 3204.39 2706.04 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east33 -loc 3119.39 2785.76 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east34 -loc 3204.39 2865.48 -ori R90
addInst -physical -cell PAD60NU -inst BPad_east35 -loc 3119.39 2945.2 -ori R90
addInst -physical -cell PAD60GU -inst BPad_east36 -loc 3204.39 3024.92 -ori R90
addInst -physical -cell PAD60NU -inst BPad_south1 -loc 234.775 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south2 -loc 314.55 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south3 -loc 394.325 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south4 -loc 474.1 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south5 -loc 553.875 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south6 -loc 633.65 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south7 -loc 713.425 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south8 -loc 793.2 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south9 -loc 872.975 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south10 -loc 952.75 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south11 -loc 1032.525 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south12 -loc 1112.3 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south13 -loc 1192.075 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south14 -loc 1271.845 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south15 -loc 1351.615 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south16 -loc 1431.385 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south17 -loc 1511.155 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south18 -loc 1590.925 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south19 -loc 1670.695 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south20 -loc 1750.465 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south21 -loc 1830.235 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south22 -loc 1910.005 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south23 -loc 1989.775 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south24 -loc 2069.545 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south25 -loc 2149.32 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south26 -loc 2229.095 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south27 -loc 2308.87 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south28 -loc 2388.645 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south29 -loc 2468.42 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south30 -loc 2548.195 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south31 -loc 2627.97 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south32 -loc 2707.745 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south33 -loc 2787.52 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south34 -loc 2867.295 0 -ori R0
addInst -physical -cell PAD60NU -inst BPad_south35 -loc 2947.07 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_south36 -loc 3026.845 0 -ori R0
addInst -physical -cell PAD60GU -inst BPad_north1 -loc 234.775 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north2 -loc 314.55 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north3 -loc 394.325 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north4 -loc 474.1 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north5 -loc 553.875 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north6 -loc 633.65 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north7 -loc 713.425 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north8 -loc 793.2 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north9 -loc 872.975 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north10 -loc 952.75 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north11 -loc 1032.525 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north12 -loc 1112.3 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north13 -loc 1192.075 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north14 -loc 1271.845 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north15 -loc 1351.615 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north16 -loc 1431.385 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north17 -loc 1511.155 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north18 -loc 1590.925 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north19 -loc 1670.695 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north20 -loc 1750.465 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north21 -loc 1830.235 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north22 -loc 1910.005 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north23 -loc 1989.775 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north24 -loc 2069.545 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north25 -loc 2149.32 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north26 -loc 2229.095 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north27 -loc 2308.87 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north28 -loc 2388.645 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north29 -loc 2468.42 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north30 -loc 2548.195 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north31 -loc 2627.97 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north32 -loc 2707.745 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north33 -loc 2787.52 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north34 -loc 2867.295 3117.41 -ori R180
addInst -physical -cell PAD60GU -inst BPad_north35 -loc 2947.07 3202.41 -ori R180
addInst -physical -cell PAD60NU -inst BPad_north36 -loc 3026.845 3117.41 -ori R180
setDrawView place
redraw
zoomBox 20.61500 1338.35550 1181.35550 2547.04400
pan -269.70750 1341.71450
zoomBox -200.58250 1606.54200 638.05250 2479.81950
zoomBox -181.63750 1701.91700 531.20250 2444.20300
zoomBox -136.24000 1849.82750 378.78700 2386.12950
pan -17.28550 2045.45950
setLayerPreference block -isVisible 0
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
zoomBox -101.63200 1657.12000 270.47550 2044.59850
zoomBox -81.31350 1684.30700 234.97800 2013.66400
zoomBox -48.83400 1727.13400 179.68700 1965.09500
add_text -layer METAL5 -label IOVSS -pt 66 1843 -height 10
panPage 0 -1
panPage 0 -1
panPage 0 1
add_text -layer METAL5 -label IOVDD -pt 66 1682 -height 10
zoomBox -59.65400 1624.02650 256.63900 1953.38500
getOpCond -min
getOpCond -max
setRouteMode -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -routeAntennaCellName {}
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X1 DLY3X1 DLY2X1 DLY1X1 CLKBUFXL CLKBUFX8 CLKBUFX4 CLKBUFX3 CLKBUFX20 CLKBUFX2 CLKBUFX16 CLKBUFX12 CLKBUFX1 BUFXL BUFX8 BUFX4 BUFX3 BUFX20 BUFX2 BUFX16 BUFX12 BUFX1 INVXL INVX8 INVX4 INVX3 INVX20 INVX2 INVX16 INVX12 INVX1 CLKINVXL CLKINVX8 CLKINVX4 CLKINVX3 CLKINVX20 CLKINVX2 CLKINVX16 CLKINVX12 CLKINVX1} -maxAllowedDelay 1
setStreamOutMode -specifyViaName default -SEvianames false -virtualConnection false -uniquifyCellNamesPrefix false -snapToMGrid false -textSize 1 -version 3
setTieHiLoMode -reset
setTieHiLoMode -cell {{TIEHI TIELO}} -maxDistance 100 -maxFanOut 20 -honorDontTouch false -createHierPort false
streamOut CHIP.gds -mapFile streamOut.map -libName DesignLib -merge { ../../cell_lib/CBDK_TSMC018_Arm_v3.2/CIC/Phantom/tsmc18_io.gds } -outputMacros -units 1000 -mode ALL
streamOut CHIP.gds -mapFile streamOut.map -libName DesignLib -merge { ../../cell_lib/CBDK_TSMC018_Arm_v3.2/CIC/Phantom/tsmc18_io.gds ../../cell_lib/CBDK_TSMC018_Arm_v3.2/CIC/Phantom/tsmc18_core.gds } -outputMacros -units 1000 -mode ALL
streamOut CHIP.gds -mapFile streamOut.map -libName DesignLib -merge { ../../cell_lib/CBDK_TSMC018_Arm_v3.2/CIC/Phantom/tsmc18_io.gds ../../cell_lib/CBDK_TSMC018_Arm_v3.2/CIC/Phantom/tsmc18_core.gds ../../cell_lib/CBDK_TSMC018_Arm_v3.2/CIC/Phantom/tpb973gv.gds } -outputMacros -units 1000 -mode ALL
saveDesign final.enc
fit
fit
