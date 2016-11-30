LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_biestableD IS END test_biestableD;

ARCHITECTURE test_1 OF test_biestableD IS
	COMPONENT BiestableD IS
		PORT	(D,CLK: IN std_logic;
			 rstH, prstH: IN std_logic;
			 Q: OUT std_logic);
	END COMPONENT;
	FOR C1: BiestableD USE ENTITY WORK.BiestableD;
	
	-- Declaración de señales
	SIGNAL D, CLK, rstH, prstH:std_logic:='0';
	SIGNAL Q: std_logic;

	-- Cuerpo de la arquitectura

	BEGIN
	
	C1: BiestableD PORT MAP(D=>D, CLK=>CLK, rstH=>rstH, Q=>Q, prstH=>prstH);

	-- Asignación de valores

	rstH<='0', '1' AFTER 50 ns;
	prstH<='1', '0' AFTER 20 ns, '1' AFTER 40 ns, '0' AFTER 60 ns, '1' AFTER 80 ns, '0' AFTER 100 ns;
	D<= '0', '1' AFTER 25 ns, '0' AFTER 50 ns, '1' AFTER 75 ns, '0' AFTER 100 ns;
	
	PROCESS(CLK) BEGIN
		CLK<=NOT CLK AFTER 10 ns;
	END PROCESS;
END test_1;