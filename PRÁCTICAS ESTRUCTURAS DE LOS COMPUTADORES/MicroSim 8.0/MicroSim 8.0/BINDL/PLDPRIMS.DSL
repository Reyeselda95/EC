PROCEDURE MK_CNST (OUTPUT HI,LO);
	HI = 1;
	LO = 0;
END MK_CNST;

PROCEDURE DLAT(OUTPUT q, q_bar; INPUT d, latch);
	D_LATCH x LATCHED_BY latch;
	x = d;
	q = x;
	q_bar = /x;
END DLAT;

PROCEDURE DLATR(OUTPUT q, q_bar; INPUT d, latch, not_reset);
	D_LATCH x LATCHED_BY latch RESET_BY /not_reset;
	x = d;
	q = x;
	q_bar = /x;
END DLATR;

PROCEDURE DLATRS(OUTPUT q, q_bar; INPUT d, latch, not_reset, not_preset);
	D_LATCH x LATCHED_BY latch RESET_BY /not_reset PRESET_BY /not_preset;
	x = d;
	q = x;
	q_bar = /x;
END DLATRS;

PROCEDURE DLATS(OUTPUT q, q_bar; INPUT d, latch, not_preset);
	D_LATCH x LATCHED_BY latch PRESET_BY /not_preset;
	x = d;
	q = x;
	q_bar = /x;
END DLATS;

PROCEDURE DLATRH(OUTPUT q, q_bar; INPUT d, latch, reset);
	D_LATCH x LATCHED_BY latch RESET_BY reset;
	x = d;
	q = x;
	q_bar = /x;
END DLATRH;

PROCEDURE DLATRSH(OUTPUT q, q_bar; INPUT d, latch, reset, preset);
	D_LATCH x LATCHED_BY latch RESET_BY reset PRESET_BY preset;
	x = d;
	q = x;
	q_bar = /x;
END DLATRSH;

PROCEDURE DLATSH(OUTPUT q, q_bar; INPUT d, latch, preset);
	D_LATCH x LATCHED_BY latch PRESET_BY preset;
	x = d;
	q = x;
	q_bar = /x;
END DLATSH;

PROCEDURE DFFC(OUTPUT q, q_bar; INPUT d, clk, ce);
	D_FLOP x CLOCK_ENABLED_BY ce CLOCKED_BY clk;
	x = d;
	q = x;
	q_bar = /x;
END DFFC;

PROCEDURE DFFCRH(OUTPUT q, q_bar; INPUT d, clk, ce, reset);
	D_FLOP x CLOCK_ENABLED_BY ce CLOCKED_BY clk RESET_BY reset;
	x = d;
	q = x;
	q_bar = /x;
END DFFCRH;

PROCEDURE DFFCRSH(OUTPUT q, q_bar; INPUT d, clk, ce, reset, preset);
	D_FLOP x CLOCK_ENABLED_BY ce CLOCKED_BY clk RESET_BY reset PRESET_BY preset;
	x = d;
	q = x;
	q_bar = /x;
END DFFCRSH;

PROCEDURE DFFCSH(OUTPUT q, q_bar; INPUT d, clk, ce, preset);
	D_FLOP x CLOCK_ENABLED_BY ce CLOCKED_BY clk PRESET_BY preset;
	x = d;
	q = x;
	q_bar = /x;
END DFFCSH;


PROCEDURE DFFCR(OUTPUT q, q_bar; INPUT d, clk, ce, not_reset);
	D_FLOP x CLOCK_ENABLED_BY ce CLOCKED_BY clk RESET_BY /not_reset;
	x = d;
	q = x;
	q_bar = /x;
END DFFCR;

PROCEDURE DFFCRS(OUTPUT q, q_bar; INPUT d, clk, ce, not_reset, not_preset);
	D_FLOP x CLOCK_ENABLED_BY ce CLOCKED_BY clk RESET_BY /not_reset PRESET_BY /not_preset;
	x = d;
	q = x;
	q_bar = /x;
END DFFCRS;

PROCEDURE DFFCS(OUTPUT q, q_bar; INPUT d, clk, ce, not_preset);
	D_FLOP x CLOCK_ENABLED_BY ce CLOCKED_BY clk PRESET_BY /not_preset;
	x = d;
	q = x;
	q_bar = /x;
END DFFCS;

PROCEDURE DFF(OUTPUT q CLOCKED_BY clk; OUTPUT q_bar; INPUT d, clk);
        q = d;
	q_bar = /q;
END DFF;

PROCEDURE DFFR(OUTPUT q, q_bar; INPUT d, clk, not_reset);
	D_FLOP x CLOCKED_BY clk RESET_BY /not_reset;
	x = d;
	q = x;
	q_bar = /x;
END DFFR;

PROCEDURE DFFRS(OUTPUT q, q_bar; INPUT d, clk, not_reset, not_preset);
	D_FLOP x CLOCKED_BY clk RESET_BY /not_reset PRESET_BY /not_preset;
	x = d;
	q = x;
	q_bar = /x;
END DFFRS;

PROCEDURE DFFS(OUTPUT q, q_bar; INPUT d, clk, not_preset);
	D_FLOP x CLOCKED_BY clk PRESET_BY /not_preset;
	x = d;
	q = x;
	q_bar = /x;
END DFFS;

PROCEDURE DFFRH(OUTPUT q, q_bar; INPUT d, clk, reset);
	D_FLOP x CLOCKED_BY clk RESET_BY reset;
	x = d;
	q = x;
	q_bar = /x;
END DFFRH;

PROCEDURE DFFRSH(OUTPUT q, q_bar; INPUT d, clk, reset, preset);
	D_FLOP x CLOCKED_BY clk RESET_BY reset PRESET_BY preset;
	x = d;
	q = x;
	q_bar = /x;
END DFFRSH;

PROCEDURE DFFSH(OUTPUT q, q_bar; INPUT d, clk, preset);
	D_FLOP x CLOCKED_BY clk PRESET_BY preset;
	x = d;
	q = x;
	q_bar = /x;
END DFFSH;

PROCEDURE JKFF(OUTPUT q, q_bar; INPUT j, clk, k);
	JK_FLOP x CLOCKED_BY clk;
	x.j = j;
	x.k = k;
	q = x;
	q_bar = /x;
END JKFF;

PROCEDURE JKFFR(OUTPUT q, q_bar; INPUT j, clk, k, not_reset);
	JK_FLOP x CLOCKED_BY clk RESET_BY /not_reset;
	x.j = j;
	x.k = k;
	q = x;
	q_bar = /x;
END JKFFR;

PROCEDURE JKFFRS(OUTPUT q, q_bar; INPUT j, clk, k, not_reset, not_preset);
	JK_FLOP x CLOCKED_BY clk RESET_BY /not_reset PRESET_BY /not_preset;
	x.j = j;
	x.k = k;
	q = x;
	q_bar = /x;
END JKFFRS;

PROCEDURE JKFFS(OUTPUT q, q_bar; INPUT j, clk, k, not_preset);
	JK_FLOP x CLOCKED_BY clk PRESET_BY /not_preset;
	x.j = j;
	x.k = k;
	q = x;
	q_bar = /x;
END JKFFS;

PROCEDURE JKFFRH(OUTPUT q, q_bar; INPUT j, clk, k, reset);
	JK_FLOP x CLOCKED_BY clk RESET_BY reset;
	x.j = j;
	x.k = k;
	q = x;
	q_bar = /x;
END JKFFRH;

PROCEDURE JKFFRSH(OUTPUT q, q_bar; INPUT j, clk, k, reset, preset);
	JK_FLOP x CLOCKED_BY clk RESET_BY reset PRESET_BY preset;
	x.j = j;
	x.k = k;
	q = x;
	q_bar = /x;
END JKFFRSH;

PROCEDURE JKFFSH(OUTPUT q, q_bar; INPUT j, clk, k, preset);
	JK_FLOP x CLOCKED_BY clk PRESET_BY preset;
	x.j = j;
	x.k = k;
	q = x;
	q_bar = /x;
END JKFFSH;

PROCEDURE RSFF(OUTPUT q, q_bar; INPUT se, clk, re);
	SR_FLOP x CLOCKED_BY clk;
	x.s = se;
	x.r = re;
	q = x;
	q_bar = /x;
END RSFF;

PROCEDURE RSFFR(OUTPUT q, q_bar; INPUT se, clk, re, not_reset);
	SR_FLOP x CLOCKED_BY clk RESET_BY /not_reset;
	x.s = se;
	x.r = re;
	q = x;
	q_bar = /x;
END RSFFR;

PROCEDURE RSFFRS(OUTPUT q, q_bar; INPUT se, clk, re, not_reset, not_preset);
	SR_FLOP x CLOCKED_BY clk RESET_BY /not_reset PRESET_BY /not_preset;
	x.s = se;
	x.r = re;
	q = x;
	q_bar = /x;
END RSFFRS;

PROCEDURE RSFFS(OUTPUT q, q_bar; INPUT se, clk, re, not_preset);
	SR_FLOP x CLOCKED_BY clk PRESET_BY /not_preset;
	x.s = se;
	x.r = re;
	q = x;
	q_bar = /x;
END RSFFS;

PROCEDURE RSFFRH(OUTPUT q, q_bar; INPUT se, clk, re, reset);
	SR_FLOP x CLOCKED_BY clk RESET_BY reset;
	x.s = se;
	x.r = re;
	q = x;
	q_bar = /x;
END RSFFRH;

PROCEDURE RSFFRSH(OUTPUT q, q_bar; INPUT se, clk, re, reset, preset);
	SR_FLOP x CLOCKED_BY clk RESET_BY reset PRESET_BY preset;
	x.s = se;
	x.r = re;
	q = x;
	q_bar = /x;
END RSFFRSH;

PROCEDURE RSFFSH(OUTPUT q, q_bar; INPUT se, clk, re, preset);
	SR_FLOP x CLOCKED_BY clk PRESET_BY preset;
	x.s = se;
	x.r = re;
	q = x;
	q_bar = /x;
END RSFFSH;

PROCEDURE TFF(OUTPUT q, q_bar; INPUT t, clk);
	T_FLOP x CLOCKED_BY clk;
	x.t = t;
	q = x;
	q_bar = /x;
END TFF;

PROCEDURE TFFR(OUTPUT q, q_bar; INPUT t, clk, not_reset);
	T_FLOP x CLOCKED_BY clk RESET_BY /not_reset;
	x.t = t;
	q = x;
	q_bar = /x;
END TFFR;

PROCEDURE TFFRS(OUTPUT q, q_bar; INPUT t, clk, not_reset, not_preset);
	T_FLOP x CLOCKED_BY clk RESET_BY /not_reset PRESET_BY /not_preset;
	x.t = t;
	q = x;
	q_bar = /x;
END TFFRS;

PROCEDURE TFFS(OUTPUT q, q_bar; INPUT t, clk, not_preset);
	T_FLOP x CLOCKED_BY clk PRESET_BY /not_preset;
	x.t = t;
	q = x;
	q_bar = /x;
END TFFS;


PROCEDURE TFFRH(OUTPUT q, q_bar; INPUT t, clk, reset);
	T_FLOP x CLOCKED_BY clk RESET_BY reset;
	x.t = t;
	q = x;
	q_bar = /x;
END TFFRH;

PROCEDURE TFFRSH(OUTPUT q, q_bar; INPUT t, clk, reset, preset);
	T_FLOP x CLOCKED_BY clk RESET_BY reset PRESET_BY preset;
	x.t = t;
	q = x;
	q_bar = /x;
END TFFRSH;

PROCEDURE TFFSH(OUTPUT q, q_bar; INPUT t, clk, preset);
	T_FLOP x CLOCKED_BY clk PRESET_BY preset;
	x.t = t;
	q = x;
	q_bar = /x;
END TFFSH;

FUNCTION fGND();
	RETURN 0;
END fGND;

FUNCTION fVCC();
	RETURN 1;
END fVCC;

FUNCTION INVTH(i, oe);
	NODE x ENABLED_BY oe;
	x = /i;
	RETURN x;
END INVTH;

FUNCTION INVTL(i, not_oe);
	NODE x ENABLED_BY /not_oe;
	x = /i;
	RETURN x;
END INVTL;

FUNCTION BUFTH(i, oe);
	NODE x ENABLED_BY oe;
	x = i;
	RETURN x;
END BUFTH;

FUNCTION BUFTL(i, not_oe);
	NODE x ENABLED_BY /not_oe;
	x = i;
	RETURN x;
END BUFTL;

FUNCTION PORTNODE(i);
	PHYSICAL NODE x;
	x = i;
	RETURN x;
END PORTNODE;

PROCEDURE ADD1(OUTPUT s0, cout; INPUT a0, b0, cin);
	VIRTUAL NODE dummy;
	[cout,s0,dummy] = [0,a0,1] .+. [0,b0,cin];
END ADD1;

PROCEDURE ADD2(OUTPUT s0, s1, cout; INPUT a0, a1, b0, b1, cin);
	VIRTUAL NODE dummy;
	[cout,s1,s0,dummy] = [0,a1,a0,1] .+. [0,b1,b0,cin];
END ADD2;

PROCEDURE ADD3(OUTPUT s0, s1, s2, cout; 
			   INPUT a0, a1, a2, b0, b1, b2, cin);
	VIRTUAL NODE dummy;
	[cout,s2,s1,s0,dummy] = [0,a2,a1,a0,1] .+. [0,b2,b1,b0,cin];
END ADD3;

PROCEDURE ADD4(OUTPUT s0, s1, s2, s3, cout; 
			   INPUT a0, a1, a2, a3, b0, b1, b2, b3, cin);
	VIRTUAL NODE dummy;
	[cout,s3,s2,s1,s0,dummy] = [0,a3,a2,a1,a0,1] .+. [0,b3,b2,b1,b0,cin];
END ADD4;

PROCEDURE ADD8(OUTPUT s0, s1, s2, s3, s4, s5, s6, s7, cout; 
			   INPUT a0, a1, a2, a3, a4, a5, a6, a7,
					 b0, b1, b2, b3, b4, b5, b6, b7, cin);
	VIRTUAL NODE dummy;
	[cout,s7,s6,s5,s4,s3,s2,s1,s0,dummy] = [0,a7,a6,a5,a4,a3,a2,a1,a0,1] .+. [0,b7,b6,b5,b4,b3,b2,b1,b0,cin];
END ADD8;
