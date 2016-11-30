PROCEDURE DFF(OUTPUT q CLOCKED_BY clk RESET_BY /clrn PRESET_BY /prn; 
          INPUT d, clk, clrn, prn);
	q = d;
END DFF;

PROCEDURE DFFE(OUTPUT q; INPUT d, clk, clrn, prn, ena);
        D_FLOP x CLOCKED_BY clk RESET_BY /clrn PRESET_BY /prn;
        x = d*ena + x*/ena;
	q = x;
END DFFE;

FUNCTION TRI(i, oe);
	NODE x ENABLED_BY oe;
	x = i;
	RETURN x;
END TRI;

FUNCTION fGND();
	RETURN 0;
END fGND;

FUNCTION fVCC();
	RETURN 1;
END fVCC;

