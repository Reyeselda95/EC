----------------------------------------
--                                    --
-- Definición de la entidad para      --
-- el sumador completo                --
--                                    --
----------------------------------------

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY Sumador_completo IS

	PORT (X, Y, Cin : IN STD_LOGIC;
		Sum, Cout : OUT STD_LOGIC);

END Sumador_completo;