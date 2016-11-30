LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY test_contador IS END test_contador;

ARCHITECTURE test_1 OF test_contador IS
	COMPONENT contador IS
		GENERIC(NBits:INTEGER:=8);
		PORT(	CLK, rst: IN std_logic;
			Q: INOUT std_logic_vector(NBits-1 DOWNTO 0));
	END COMPONENT;
FOR C1: contador USE ENTITY WORK.contador;

-- Declaración de las señales

SIGNAL CLK, rst: std_logic:='0';
SIGNAL Q: std_logic_vector(7 DOWNTO 0);

-- Cuerpo de la aruqitectura

BEGIN
C1: contador PORT MAP(CLK => CLK, rst => rst, Q => Q);

-- Asignación de valores

rst<='1', '0' AFTER 80 ns, '1' AFTER 90 ns, '0' AFTER 100 ns, '1' AFTER 120 ns;

PROCESS(CLK) BEGIN
	CLK <= NOT CLK AFTER 25 ns;
END PROCESS;
END test_1;