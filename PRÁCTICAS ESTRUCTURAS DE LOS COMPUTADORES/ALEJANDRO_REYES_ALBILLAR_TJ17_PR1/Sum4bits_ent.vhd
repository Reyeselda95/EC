-- Sum4bits_ent.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sumador_4bits IS

 PORT( A, B:  IN std_logic_vector (3 DOWNTO 0);
	 C0: IN std_logic;
	 C4: OUT std_logic;
	 S: OUT std_logic_vector (3  DOWNTO 0)
	);
END sumador_4bits;