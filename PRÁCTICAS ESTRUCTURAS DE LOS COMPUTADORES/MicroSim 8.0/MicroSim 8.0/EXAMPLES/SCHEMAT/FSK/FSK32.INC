* generic flipflop for fsk example

.subckt flipflop D CLK Q Qbar optional: dpwr=$g_dpwr dgnd=$g_dgnd
uff1 dff(1) dpwr dgnd $d_hi $d_hi clk d q qbar dff1 io_as00
+ mntymxdly=0 io_level=0

.model dff1 ueff
+(tsudclkmn=0.2ns tsudclkmx=0.2ns
+ thdclkmn=0.0ns thdclkmx=0.2ns
+ tpclkqlhty=0.5ns tpclkqlhmx=0.8ns
+ tpclkqhlty=0.5ns tpclkqhlmx=0.9ns)

.ends
