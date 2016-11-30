LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_DMUX IS END test_DMUX;

ARCHITECTURE test_1 OF test_DMUX IS

COMPONENT DMUX IS 
PORT	(DataIN, Enable: IN std_logic;
	 Sel: IN std_logic_vector(2 DOWNTO 0);
	 DataOUT: OUT std_logic_vector(7 DOWNTO 0));
END COMPONENT;

FOR C1: DMUX USE ENTITY WORK.DMUX;

-- Declaración de señales

SIGNAL DataIN, Enable: std_logic:='0';
SIGNAL Sel: std_logic_vector(2 DOWNTO 0);
SIGNAL DataOUT: std_logic_vector(7 DOWNTO 0);

-- Cuerpo de la arquitectura
BEGIN
	C1: DMUX PORT MAP(DataIN=>DataIN, Enable=>Enable, Sel=>Sel, DataOUT=>DataOUT);

-- Asignación de valores

PROCESS(Enable) BEGIN
	Enable<= NOT Enable AFTER 10 ns;
END PROCESS;

PROCESS(DataIN)BEGIN
	DataIN<=NOT DataIN AFTER 2 ns;
END PROCESS;

Sel<="000", "001" AFTER 12 ns, "010" AFTER 24 ns, "011" AFTER 36 ns, "100" AFTER 48 ns, "101" AFTER 60 ns, "110" AFTER 72 ns, "111" AFTER 84 ns;

END test_1;