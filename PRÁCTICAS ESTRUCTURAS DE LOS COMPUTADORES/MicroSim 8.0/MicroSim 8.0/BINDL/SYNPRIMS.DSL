PROCEDURE DLAT(OUTPUT q; INPUT d, latch);
	D_LATCH x LATCHED_BY latch;
	x = d;
	q = x;
END DLAT;

PROCEDURE DLATR(OUTPUT q; INPUT d, latch, not_reset);
	D_LATCH x LATCHED_BY latch RESET_BY /not_reset;
	x = d;
	q = x;
END DLATR;

PROCEDURE DLATRS(OUTPUT q; INPUT d, latch, not_reset, not_preset);
	D_LATCH x LATCHED_BY latch RESET_BY /not_reset PRESET_BY /not_preset;
	x = d;
	q = x;
END DLATRS;

PROCEDURE DLATS(OUTPUT q; INPUT d, latch, not_preset);
	D_LATCH x LATCHED_BY latch PRESET_BY /not_preset;
	x = d;
	q = x;
END DLATS;

PROCEDURE DLATRH(OUTPUT q; INPUT d, latch, reset);
	D_LATCH x LATCHED_BY latch RESET_BY reset;
	x = d;
	q = x;
END DLATRH;

PROCEDURE DLATRSH(OUTPUT q; INPUT d, latch, reset, preset);
	D_LATCH x LATCHED_BY latch RESET_BY reset PRESET_BY preset;
	x = d;
	q = x;
END DLATRSH;

PROCEDURE DLATSH(OUTPUT q; INPUT d, latch, preset);
	D_LATCH x LATCHED_BY latch PRESET_BY preset;
	x = d;
	q = x;
END DLATSH;

PROCEDURE DFFC(OUTPUT q; INPUT d, clk, ce);
	D_FLOP x CLOCK_ENABLED_BY ce CLOCKED_BY clk;
	x = d;
	q = x;
END DFFC;

PROCEDURE DFFCRH(OUTPUT q; INPUT d, clk, ce, reset);
	D_FLOP x CLOCK_ENABLED_BY ce CLOCKED_BY clk RESET_BY reset;
	x = d;
	q = x;
END DFFCRH;

PROCEDURE DFFCRSH(OUTPUT q; INPUT d, clk, ce, reset, preset);
	D_FLOP x CLOCK_ENABLED_BY ce CLOCKED_BY clk RESET_BY reset PRESET_BY preset;
	x = d;
	q = x;
END DFFCRSH;

PROCEDURE DFFCSH(OUTPUT q; INPUT d, clk, ce, preset);
	D_FLOP x CLOCK_ENABLED_BY ce CLOCKED_BY clk PRESET_BY preset;
	x = d;
	q = x;
END DFFCSH;


PROCEDURE DFFCR(OUTPUT q; INPUT d, clk, ce, not_reset);
	D_FLOP x CLOCK_ENABLED_BY ce CLOCKED_BY clk RESET_BY /not_reset;
	x = d;
	q = x;
END DFFCR;

PROCEDURE DFFCRS(OUTPUT q; INPUT d, clk, ce, not_reset, not_preset);
	D_FLOP x CLOCK_ENABLED_BY ce CLOCKED_BY clk RESET_BY /not_reset PRESET_BY /not_preset;
	x = d;
	q = x;
END DFFCRS;

PROCEDURE DFFCS(OUTPUT q; INPUT d, clk, ce, not_preset);
	D_FLOP x CLOCK_ENABLED_BY ce CLOCKED_BY clk PRESET_BY /not_preset;
	x = d;
	q = x;
END DFFCS;

PROCEDURE DFF(OUTPUT q; INPUT d, clk);
	D_FLOP x CLOCKED_BY clk;
	x = d;
	q = x;
END DFF;

PROCEDURE DFFR(OUTPUT q; INPUT d, clk, not_reset);
	D_FLOP x CLOCKED_BY clk RESET_BY /not_reset;
	x = d;
	q = x;
END DFFR;

PROCEDURE DFFRS(OUTPUT q; INPUT d, clk, not_reset, not_preset);
	D_FLOP x CLOCKED_BY clk RESET_BY /not_reset PRESET_BY /not_preset;
	x = d;
	q = x;
END DFFRS;

PROCEDURE DFFS(OUTPUT q; INPUT d, clk, not_preset);
	D_FLOP x CLOCKED_BY clk PRESET_BY /not_preset;
	x = d;
	q = x;
END DFFS;

PROCEDURE DFFRH(OUTPUT q; INPUT d, clk, reset);
	D_FLOP x CLOCKED_BY clk RESET_BY reset;
	x = d;
	q = x;
END DFFRH;

PROCEDURE DFFRSH(OUTPUT q; INPUT d, clk, reset, preset);
	D_FLOP x CLOCKED_BY clk RESET_BY reset PRESET_BY preset;
	x = d;
	q = x;
END DFFRSH;

PROCEDURE DFFSH(OUTPUT q; INPUT d, clk, preset);
	D_FLOP x CLOCKED_BY clk PRESET_BY preset;
	x = d;
	q = x;
END DFFSH;

PROCEDURE JKFF(OUTPUT q; INPUT j, clk, k);
	JK_FLOP x CLOCKED_BY clk;
	x.j = j;
	x.k = k;
	q = x;
END JKFF;

PROCEDURE JKFFR(OUTPUT q; INPUT j, clk, k, not_reset);
	JK_FLOP x CLOCKED_BY clk RESET_BY /not_reset;
	x.j = j;
	x.k = k;
	q = x;
END JKFFR;

PROCEDURE JKFFRS(OUTPUT q; INPUT j, clk, k, not_reset, not_preset);
	JK_FLOP x CLOCKED_BY clk RESET_BY /not_reset PRESET_BY /not_preset;
	x.j = j;
	x.k = k;
	q = x;
END JKFFRS;

PROCEDURE JKFFS(OUTPUT q; INPUT j, clk, k, not_preset);
	JK_FLOP x CLOCKED_BY clk PRESET_BY /not_preset;
	x.j = j;
	x.k = k;
	q = x;
END JKFFS;

PROCEDURE JKFFRH(OUTPUT q; INPUT j, clk, k, reset);
	JK_FLOP x CLOCKED_BY clk RESET_BY reset;
	x.j = j;
	x.k = k;
	q = x;
END JKFFRH;

PROCEDURE JKFFRSH(OUTPUT q; INPUT j, clk, k, reset, preset);
	JK_FLOP x CLOCKED_BY clk RESET_BY reset PRESET_BY preset;
	x.j = j;
	x.k = k;
	q = x;
END JKFFRSH;

PROCEDURE JKFFSH(OUTPUT q; INPUT j, clk, k, preset);
	JK_FLOP x CLOCKED_BY clk PRESET_BY preset;
	x.j = j;
	x.k = k;
	q = x;
END JKFFSH;

PROCEDURE RSFF(OUTPUT q; INPUT se, clk, re);
	SR_FLOP x CLOCKED_BY clk;
	x.s = se;
	x.r = re;
	q = x;
END RSFF;

PROCEDURE RSFFR(OUTPUT q; INPUT se, clk, re, not_reset);
	SR_FLOP x CLOCKED_BY clk RESET_BY /not_reset;
	x.s = se;
	x.r = re;
	q = x;
END RSFFR;

PROCEDURE RSFFRS(OUTPUT q; INPUT se, clk, re, not_reset, not_preset);
	SR_FLOP x CLOCKED_BY clk RESET_BY /not_reset PRESET_BY /not_preset;
	x.s = se;
	x.r = re;
	q = x;
END RSFFRS;

PROCEDURE RSFFS(OUTPUT q; INPUT se, clk, re, not_preset);
	SR_FLOP x CLOCKED_BY clk PRESET_BY /not_preset;
	x.s = se;
	x.r = re;
	q = x;
END RSFFS;

PROCEDURE RSFFRH(OUTPUT q; INPUT se, clk, re, reset);
	SR_FLOP x CLOCKED_BY clk RESET_BY reset;
	x.s = se;
	x.r = re;
	q = x;
END RSFFRH;

PROCEDURE RSFFRSH(OUTPUT q; INPUT se, clk, re, reset, preset);
	SR_FLOP x CLOCKED_BY clk RESET_BY reset PRESET_BY preset;
	x.s = se;
	x.r = re;
	q = x;
END RSFFRSH;

PROCEDURE RSFFSH(OUTPUT q; INPUT se, clk, re, preset);
	SR_FLOP x CLOCKED_BY clk PRESET_BY preset;
	x.s = se;
	x.r = re;
	q = x;
END RSFFSH;

PROCEDURE TFF(OUTPUT q; INPUT t, clk);
	T_FLOP x CLOCKED_BY clk;
	x.t = t;
	q = x;
END TFF;

PROCEDURE TFFR(OUTPUT q; INPUT t, clk, not_reset);
	T_FLOP x CLOCKED_BY clk RESET_BY /not_reset;
	x.t = t;
	q = x;
END TFFR;

PROCEDURE TFFRS(OUTPUT q; INPUT t, clk, not_reset, not_preset);
	T_FLOP x CLOCKED_BY clk RESET_BY /not_reset PRESET_BY /not_preset;
	x.t = t;
	q = x;
END TFFRS;

PROCEDURE TFFS(OUTPUT q; INPUT t, clk, not_preset);
	T_FLOP x CLOCKED_BY clk PRESET_BY /not_preset;
	x.t = t;
	q = x;
END TFFS;


PROCEDURE TFFRH(OUTPUT q; INPUT t, clk, reset);
	T_FLOP x CLOCKED_BY clk RESET_BY reset;
	x.t = t;
	q = x;
END TFFRH;

PROCEDURE TFFRSH(OUTPUT q; INPUT t, clk, reset, preset);
	T_FLOP x CLOCKED_BY clk RESET_BY reset PRESET_BY preset;
	x.t = t;
	q = x;
END TFFRSH;

PROCEDURE TFFSH(OUTPUT q; INPUT t, clk, preset);
	T_FLOP x CLOCKED_BY clk PRESET_BY preset;
	x.t = t;
	q = x;
END TFFSH;

PROCEDURE INVTH(OUTPUT o; INPUT i, oe);
	NODE x ENABLED_BY oe;
	x = /i;
	o = x;
END INVTH;

PROCEDURE INVTL(OUTPUT o; INPUT i, not_oe);
	NODE x ENABLED_BY /not_oe;
	x = /i;
	o = x;
END INVTL;

PROCEDURE BUFA(OUTPUT o; INPUT i );
	o = i;
END BUFA;

PROCEDURE BUFTH(OUTPUT o; INPUT i, oe);
	NODE x ENABLED_BY oe;
	x = i;
	o = x;
END BUFTH;

PROCEDURE BUFTL(OUTPUT o; INPUT i, not_oe);
	NODE x ENABLED_BY /not_oe;
	x = i;
	o = x;
END BUFTL;

PROCEDURE PORTNODE(OUTPUT o; INPUT i);
	PHYSICAL NODE x;
	x = i;
	o = x;
END PORTNODE;

PROCEDURE POWER__1( OUTPUT O );
    O = 1;
END POWER__1;

PROCEDURE POWER__0( OUTPUT O );
    O = 0;
END POWER__0;
