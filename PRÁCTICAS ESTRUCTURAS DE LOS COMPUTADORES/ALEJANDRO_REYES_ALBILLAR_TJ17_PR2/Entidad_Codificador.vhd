LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Codificador IS
PORT	(DataIN: IN std_logic_vector(9 DOWNTO 0);
	 Enable: IN std_logic;
	 DataOUT: OUT std_logic_vector(3 DOWNTO 0));
END Codificador;