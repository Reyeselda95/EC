" MULT2
"
" This example is another implementation of a 4x4 multiplier.
" It uses the built in addition operator.

"
" 4-bit multiplier implemented with combinatorial logic.
"
FUNCTION mult1(a[1], b[1])[1];
	RETURN a*b;
END mult1;

FUNCTION mult2(a[2],b[2])[4];
	RETURN [0, 0, 0, mult1(a[0], b[0])]
	   .+. [0, 0, mult1(a[1], b[0]), 0]
	   .+. [0, 0, mult1(a[0], b[1]), 0]
	   .+. [0, mult1(a[1], b[1]), 0, 0];
END mult2;

FUNCTION mult4(a[4],b[4])[8];
	RETURN [0, 0, 0, 0, mult2(a[1..0], b[1..0])]
	   .+. [0, 0, mult2(a[3..2], b[1..0]), 0, 0]
	   .+. [0, 0, mult2(a[1..0], b[3..2]), 0, 0]
	   .+. [mult2(a[3..2], b[3..2]), 0, 0, 0, 0];
END mult4;

