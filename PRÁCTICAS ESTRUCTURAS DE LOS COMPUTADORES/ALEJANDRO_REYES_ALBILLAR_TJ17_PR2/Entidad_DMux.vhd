LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY DMUX IS
PORT	(DataIN, Enable: IN std_logic;
	 Sel: IN std_logic_vector(2 DOWNTO 0);
	 DataOUT: OUT std_logic_vector(7 DOWNTO 0));
END DMUX;
