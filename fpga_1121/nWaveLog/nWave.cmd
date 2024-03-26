verdiSetActWin -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/Ethanchen/Lab317/Verilog/fpga_1121/VCS_HW_231120_211533/HW.fsdb}
wvResizeWindow -win $_nWave1 -10 20 1920 977
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/HW_test"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/HW_test/Add} -height 17 \
{/HW_test/Inc} -height 17 \
{/HW_test/Sub} -height 17 \
{/HW_test/Switch} -height 17 \
{/HW_test/a\[3:0\]} -height 17 \
{/HW_test/b\[3:0\]} -height 17 \
{/HW_test/c\[3:0\]} -height 17 \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/HW_test/Add} -height 17 \
{/HW_test/Inc} -height 17 \
{/HW_test/Sub} -height 17 \
{/HW_test/Switch} -height 17 \
{/HW_test/a\[3:0\]} -height 17 \
{/HW_test/b\[3:0\]} -height 17 \
{/HW_test/c\[3:0\]} -height 17 \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 7.760018 -snap {("G2" 0)}
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 18.663678 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 58.514575 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 53.309774 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 53.309774 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 51.049104 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 50.000000
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetCursor -win $_nWave1 9.936437 -snap {("G2" 0)}
wvSelectGroup -win $_nWave1 {G1}
wvSetCursor -win $_nWave1 3.995604 -snap {("G2" 0)}
wvSelectGroup -win $_nWave1 {G2}
wvSelectGroup -win $_nWave1 {G2}
wvZoom -win $_nWave1 23.447889 24.183921
wvZoomAll -win $_nWave1
wvExit
