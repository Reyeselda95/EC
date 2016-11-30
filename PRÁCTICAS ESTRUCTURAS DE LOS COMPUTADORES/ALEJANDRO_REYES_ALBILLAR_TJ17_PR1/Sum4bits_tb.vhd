-- Sum4bits_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_sumador_4 IS END test_sumador_4;

ARCHITECTURE test_flujo OF test_sumador_4 IS

-- PARTE DECLARATIVA

-- Declaración del componente a testear

COMPONENT Sumador_4bits PORT( A,B: IN std_logic_vector(3 DOWNTO 0);
					C0: IN std_logic;
					C4: OUT std_logic;
					S: OUT std_logic_vector (3 DOWNTO 0));
END COMPONENT;

-- Configuración de la arquitectura (Esta parte NO ES OBLIATORIA ponerla)
-- Se toma por defecto la última arqquitectura compilada

FOR C1: Sumador_4bits USE ENTITY WORK.Sumador_4bits;

-- Declaracion de señales 

SIGNAL Dato_A, Dato_B: std_logic_vector(3 DOWNTO 0);
SIGNAL Cin: std_logic;

-- Cuerpo de la arquitectura

BEGIN

-- Instanciación del componente a testear y conexión de puntos

	C1:Sumador_4bits PORT MAP (A=> Dato_A, B=> Dato_B, C0=> Cin);

-- Valor de las señales de entrada

Cin <= '0', '1' AFTER 20 ns, '0' AFTER 40 ns, '1' AFTER 60 ns, '0' AFTER 80 ns;
Dato_A <= "0000", "1111" AFTER 10 ns, "1101" AFTER 20 ns, "1100" AFTER 30 ns, "0111" AFTER 40 ns, "0101" AFTER 50 ns, "1010" AFTER 60 ns, "0001" AFTER 70 ns, "0100" AFTER 80 ns;
Dato_B <= "1001", "0110" AFTER 10 ns, "0111" AFTER 20 ns, "0100" AFTER 30 ns, "1000" AFTER 40 ns, "1001" AFTER 50 ns, "1111" AFTER 60 ns, "0101" AFTER 70 ns, "1111" AFTER 80 ns;

END test_flujo;