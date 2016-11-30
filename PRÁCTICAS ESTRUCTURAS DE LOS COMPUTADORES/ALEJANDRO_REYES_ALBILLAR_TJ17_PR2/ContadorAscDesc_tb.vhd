LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;

ENTITY test_contadorAscDesc IS END test_contadorAscDesc;

ARCHITECTURE test_1 OF test_contadorAscDesc IS

COMPONENT ContadorAscDesc IS
GENERIC(Nbits:INTEGER :=6);
PORT	(Carga, Clk, reset: IN std_logic;
	 Dato: IN std_logic_vector(Nbits-1 DOWNTO 0);
	 Sal: INOUT std_logic_vector(Nbits-1 DOWNTO 0));
END COMPONENT;

FOR C1: ContadorAscDesc USE ENTITY WORK.ContadorAscDesc;

-- Declaracion de señales

SIGNAL Clk:std_logic:='0';
SIGNAL Carga: std_logic;
SIGNAL reset: std_logic; 
SIGNAL Dato: std_logic_vector(5 DOWNTO 0);
SIGNAL Sal: std_logic_vector(5 DOWNTO 0);

-- Cuerpo de la arquitectura

BEGIN
	C1: ContadorAscDesc PORT MAP (Carga=>Carga, Clk=>Clk, reset=>reset, Dato=>Dato, Sal=>Sal);

	-- Asignacion de valores
	PROCESS (Clk) BEGIN
		Clk<= NOT Clk AFTER 10 ns;
	END PROCESS;
	Carga<='0', '1' AFTER 30 ns, '0' AFTER 45 ns;
	reset<='0', '1' AFTER 100 ns, '0' AFTER 105 ns;
	Dato<= "111111";

END test_1;