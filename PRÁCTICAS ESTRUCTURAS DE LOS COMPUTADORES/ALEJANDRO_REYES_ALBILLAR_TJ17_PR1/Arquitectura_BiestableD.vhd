ARCHITECTURE BiestableDArq OF BiestableD IS
BEGIN
	PROCESS(CLK, rstH, prstH)
	BEGIN
		IF (rstH='1') THEN
			Q<='0';
		ELSIF(prstH='1')THEN
			Q<='1';
		ELSIF (CLK'event AND CLK='1')THEN
			Q<=D;
		END IF;
	END PROCESS;
END BiestableDArq;