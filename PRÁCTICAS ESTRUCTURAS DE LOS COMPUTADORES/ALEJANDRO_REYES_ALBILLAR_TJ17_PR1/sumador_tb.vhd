---------------------------------------
----- TestBech Sumador Completo -------
---------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY test_sumador IS END test_sumador;

ARCHITECTURE test_flujo OF test_sumador IS

--Parte Declarativa
--Declaración del componente a testear

COMPONENT Sumador_completo PORT (X,Y,Cin :IN STD_LOGIC;Sum, Cout :OUT STD_LOGIC);
END COMPONENT;

--Configuración de la arquitectura. Esta parte no es obligatoria.
--Por defecto se tomaria la última arquitectura compilada

FOR C1: Sumador_completo USE ENTITY WORK.Sumador_completo;

--Declaracion de señales

SIGNAL X,Y,Cin,Sum,Cout: STD_LOGIC;

--Cuerpo de la arquitectura

BEGIN 

--Instanciación del componente a testear y conexión a puertos

C1: Sumador_completo PORT MAP (X,Y,Cin,Sum,Cout);

--Asignamos valores a las señales de entrada

Cin <= '0','1' AFTER 5 ns,'0' AFTER 10 ns,'1' AFTER 15 ns,'0' AFTER 20 ns,'1' AFTER 25 ns,'0' AFTER 30 ns,'1' AFTER 35 ns;
Y <= '0', '1' AFTER 10 ns, '0' AFTER 20 ns, '1' AFTER 30ns;
X <= '0', '1' AFTER 20 ns;

END test_flujo;