LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_Cod IS END test_Cod;

ARCHITECTURE test_1 OF test_Cod IS 
COMPONENT Codificador IS
PORT (DataIN: IN std_logic_vector(9 DOWNTO 0);
	Enable: IN std_logic;
	DataOUT: OUT std_logic_vector(3 DOWNTO 0));
END COMPONENT;

FOR C1: Codificador USE ENTITY WORK.Codificador;

-- Declaracion de las señales
SIGNAL Enable: std_logic:='1';
SIGNAL DataIN: std_logic_vector(9 DOWNTO 0);
SIGNAL DataOUT: std_logic_vector(3 DOWNTO 0);

-- Cuerpo de la arquitectura

BEGIN
	C1: Codificador PORT MAP(DataIN=>DataIN, Enable=>Enable, DataOUT=>DataOUT);

-- Asignacion de valores

PROCESS(Enable) BEGIN
	Enable<= NOT Enable AFTER 5 ns;
END PROCESS;

DataIN<="1111111111","1111111110" AFTER 5 ns, "1111111101" AFTER 10 ns, "1111111011" AFTER 15 ns, "1111110111" AFTER 20 ns, 
	  "1111101111" AFTER 25 ns, "1111011111" AFTER 30 ns, "1110111111" AFTER 35 ns, "1101111111" AFTER 40 ns, "1011111111" AFTER 45 ns,
	  "0111111111" AFTER 50ns;

END test_1;
