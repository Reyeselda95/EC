ARCHITECTURE Comparador_Arq OF Comparador IS
BEGIN
	PROCESS(Dato_A, Dato_B) BEGIN
		IF(Dato_A(3)<Dato_B(3)) THEN
			AmayorB<='1';
			AmenorB<='0';
			AigualB<='0';
		ELSIF(Dato_A(3)>Dato_B(3)) THEN
			AmayorB<='0';
			AmenorB<='1';
			AigualB<='0';
		ELSIF(Dato_A(3)='0' and Dato_B(3)='0') THEN
			IF(Dato_A(2)<Dato_B(2)) THEN
				AmayorB<='0';
				AmenorB<='1';
				AigualB<='0';
			ELSIF(Dato_A(2)>Dato_B(2)) THEN
				AmayorB<='1';
				AmenorB<='0';
 				AigualB<='0';
			ELSE
				IF(Dato_A(1)<Dato_B(1)) THEN
					AmayorB<='0';
					AmenorB<='1';
					AigualB<='0';
				ELSIF(Dato_A(1)>Dato_B(1)) THEN
					AmayorB<='1';
					AmenorB<='0';
 					AigualB<='0';
				ELSE
					IF(Dato_A(0)<Dato_B(0)) THEN
						AmayorB<='0';
						AmenorB<='1';
						AigualB<='0';
					ELSIF(Dato_A(0)>Dato_B(0)) THEN
						AmayorB<='1';
						AmenorB<='0';
 						AigualB<='0';
					ELSE
						AmayorB<='0';
						AmenorB<='0';
 						AigualB<='1';
					END IF;
				END IF;
			END IF;
		ELSE
			IF(Dato_A(2)<Dato_B(2)) THEN
				AmayorB<='1';
				AmenorB<='0';
				AigualB<='0';
			ELSIF(Dato_A(2)>Dato_B(2)) THEN
				AmayorB<='0';
				AmenorB<='1';
 				AigualB<='0';
			ELSE
				IF(Dato_A(1)<Dato_B(1)) THEN
					AmayorB<='1';
					AmenorB<='0';
					AigualB<='0';
				ELSIF(Dato_A(1)>Dato_B(1)) THEN
					AmayorB<='0';
					AmenorB<='1';
 					AigualB<='0';
				ELSE
					IF(Dato_A(0)<Dato_B(0)) THEN
						AmayorB<='1';
						AmenorB<='0';
						AigualB<='0';
					ELSIF(Dato_A(0)>Dato_B(0)) THEN
						AmayorB<='0';
						AmenorB<='1';
 						AigualB<='0';
					ELSE
						AmayorB<='0';
						AmenorB<='0';
 						AigualB<='1';
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;
END Comparador_Arq;