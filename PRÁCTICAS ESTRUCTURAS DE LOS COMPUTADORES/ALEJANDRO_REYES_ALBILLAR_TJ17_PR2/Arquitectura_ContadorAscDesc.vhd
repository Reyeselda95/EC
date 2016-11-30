ARCHITECTURE Arq_ContadorAscDesc OF ContadorAscDesc IS
BEGIN
	PROCESS(Clk, Carga, Dato, reset, Sal) 
	VARIABLE suma: INTEGER:=1;
	VARIABLE tiempo: INTEGER:=0;
	BEGIN	
		IF tiempo=0 THEN
			Sal<= (OTHERS=>'0');
			tiempo:=tiempo+1;		
		ELSIF Reset='1' THEN
			Sal<= (OTHERS=>'0');-- OK
		ELSIF Clk'EVENT AND Clk='1' THEN
			IF Carga='1' THEN
				Sal<=Dato;-- OK
			ELSE			
				IF Sal=0 THEN
					suma:=1;
				ELSIF Sal=63 THEN -- Problemas con simulador, funciona hasta 1F en hexadecimal, el número 31
					suma:=-1;
				END IF;
				Sal<=Sal+suma;

			END IF;
		END IF;
	END PROCESS;
END Arq_ContadorAscDesc;
			
		