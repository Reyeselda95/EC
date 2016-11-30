LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_Comparador IS END test_Comparador;

ARCHITECTURE test_1 OF test_Comparador IS

COMPONENT Comparador IS
PORT (Dato_A, Dato_B: IN std_logic_vector(3 DOWNTO 0);
	AmenorB, AigualB, AmayorB: OUT std_logic);
END COMPONENT;

FOR C1: Comparador USE ENTITY WORK.Comparador;

-- Declaracion de las señales

SIGNAL Dato_A, Dato_B: std_logic_vector(3 DOWNTO 0);
SIGNAL AmenorB, AigualB, AmayorB: std_logic;

-- Cuerpo de la arquitectura 

BEGIN
	C1: Comparador PORT MAP (Dato_A=>Dato_A, Dato_B=>Dato_B, AmenorB=>AmenorB, AigualB=>AigualB, AmayorB=>AmayorB);

-- Asignacion de valores

Dato_A<="0000","1111" AFTER 10 ns, "1011" AFTER 20 ns, "0011" AFTER 30 ns, "0000" AFTER 40 ns, "0001" AFTER 50 ns;
Dato_B<="0000","1010" AFTER 10 ns, "0111" AFTER 20 ns, "0101" AFTER 30 ns, "0010" AFTER 40 ns, "0000" AFTER 50 ns;

END test_1;