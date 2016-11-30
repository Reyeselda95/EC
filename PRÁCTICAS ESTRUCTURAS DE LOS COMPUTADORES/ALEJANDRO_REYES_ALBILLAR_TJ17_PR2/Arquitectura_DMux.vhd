ARCHITECTURE Demultiplexor OF DMUX IS
BEGIN
	PROCESS(Enable)
	BEGIN
		IF Enable='1' THEN
			CASE(Sel) IS
				WHEN "000"=> 
					DataOUT(0)<=DataIN;
				WHEN "001"=> 
					DataOUT(1)<=DataIN;
				WHEN "010"=>
					DataOUT(2)<=DataIN;
				WHEN "011"=>
					DataOUT(3)<=DataIN;
				WHEN "100"=> 
					DataOUT(4)<=DataIN;
				WHEN "101"=> 
					DataOUT(5)<=DataIN;
				WHEN "110"=> 
					DataOUT(6)<=DataIN;
				WHEN "111"=> 
					DataOUT(7)<=DataIN;
				WHEN OTHERS=>
					DataOUT<="00000000";
			END CASE;
		ELSE
			DataOUT <="00000000";
		END IF;
	END PROCESS;
END Demultiplexor;