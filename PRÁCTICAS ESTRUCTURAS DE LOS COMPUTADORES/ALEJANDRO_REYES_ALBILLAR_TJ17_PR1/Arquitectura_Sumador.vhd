------------------------------------------
--                                      --
-- Definición de la arquitectura para   --
-- el sumador completo                  --
--                                      --
------------------------------------------


ARCHITECTURE Ecuaciones OF Sumador_completo IS

	BEGIN  --Asignaciones concurrentes
	
	Sum <= X XOR Y XOR Cin;
	Cout <= (X AND Y) OR (X AND Cin) OR (Y AND Cin);

	END Ecuaciones;

