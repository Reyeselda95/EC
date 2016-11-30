LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;

ENTITY contador IS 
	GENERIC(Nbits: INTEGER := 8);
	PORT( CLK, rst: IN std_logic;
		Q: INOUT std_logic_vector(NBits-1 DOWNTO 0));
END contador;