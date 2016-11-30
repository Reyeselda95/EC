ARCHITECTURE Cod_Arq OF Codificador IS
BEGIN
	--Entradas activas a nivel bajo
	PROCESS (Enable)
		BEGIN
			IF Enable='1' THEN
				IF DataIN(0)='0' THEN
					DataOUT<="1010";
				ELSIF DataIN(1)='0' THEN
					DataOUT<="1001";
				ELSIF DataIN(2)='0' THEN
					DataOUT<="1000";
				ELSIF DataIN(3)='0' THEN
					DataOUT<="0111";
				ELSIF DataIN(4)='0' THEN
					DataOUT<="0110";
				ELSIF DataIN(5)='0' THEN
					DataOUT<="0101";
				ELSIF DataIN(6)='0' THEN
					DataOUT<="0100";
				ELSIF DataIN(7)='0' THEN
					DataOUT<="0011";
				ELSIF DataIN(8)='0' THEN
					DataOUT<="0010";
				ELSIF DataIN(9)='0' THEN
					DataOUT<="0001";
				ELSE
					DataOUT<="ZZZZ";
				END IF;					
			END IF;
	END PROCESS;
END Cod_Arq;