LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY BiestableD IS
	PORT	(D,CLK: IN std_logic;
		 rstH, prstH: IN std_logic;
		 Q: OUT std_logic);
END BiestableD;
