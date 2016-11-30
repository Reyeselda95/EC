-- Sum4bits_arc1.vhd

ARCHITECTURE circuito OF sumador_4bits IS

COMPONENT Sumador_completo
	PORT(	 X,Y,Cin: IN std_logic;
		 Sum, Cout: OUT std_logic);
END COMPONENT;

SIGNAL C1,C2,C3: std_logic;

BEGIN

	Sum1: Sumador_completo PORT MAP (A(0), B(0), C0, S(0), C1);
	Sum2: Sumador_completo PORT MAP (A(1), B(1), C1, S(1), C2);
	Sum3: Sumador_completo PORT MAP (A(2), B(2), C2, S(2), C3);
	Sum4: Sumador_completo PORT MAP (A(3), B(3), C3, S(3), C4);
END circuito;