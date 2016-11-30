LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY Comparador IS 
PORT (Dato_A, Dato_B: IN std_logic_vector(3 DOWNTO 0);
	AmenorB, AigualB, AmayorB: OUT std_logic);
END Comparador;