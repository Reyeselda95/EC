LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;

ENTITY ContadorAscDesc IS
GENERIC(Nbits: INTEGER:=6);
PORT 	(Carga, Clk, reset: IN std_logic;
	 Dato: IN std_logic_vector(Nbits-1 DOWNTO 0);
	 Sal: INOUT std_logic_vector(Nbits-1 DOWNTO 0)); -- Esta señal se realimenta dentro del circuito
END ContadorAscDesc;