" ADDER2
"
" This example implements four adder FUNCTIONs instead of PROCEDUREs.
" The return value of each FUNCTION is an array 1 bit wider than the
" width of the arrays being added.  
" This example is intended to demonstrate FUNCTIONs.  For real designs,
" the builT-in addition operator '.+.' can be used to perform addition
" at any width.


" This FUNCTION implements a 1-bit adder.  The RETURN instruction makes
" the associated 2-bit array be the RETURN value of the FUNCTION.
"
FUNCTION add1(a, b, carry_in)[2];
	RETURN [a*b+a*carry_in+b*carry_in, a(+)b(+)carry_in];
END add1;


" This FUNCTION implements a 2-bit adder.
"
FUNCTION add2(a[2], b[2], carry_in)[3];
	NODE low_carry, carry, result[2];

	[low_carry, result[0]] = add1(a[0], b[0], carry_in);
	[carry, result[1]] = add1(a[1], b[1], low_carry);
	RETURN [carry, result];
END add2;


" This FUNCTION implements a 4-bit adder.  Note that the groups being
" assigned to consist of a 1-bit signal and a 2-bit array reference
" which combine to make a 3-bit group.
"

FUNCTION add4(a[4], b[4], carry_in)[5];
	NODE low_carry, carry, result[4];

	[low_carry, result[1..0]] = add2(a[1..0],b[1..0],carry_in);
	[carry, result[3..2]] = add2(a[3..2],b[3..2],low_carry);
	RETURN [carry, result];
END add4;


" This FUNCTION implements an 8-bit adder.
"
FUNCTION add8(a[8], b[8], carry_in)[9];
	NODE low_carry, carry, result[8];

	[low_carry, result[3..0]] = add4(a[3..0],b[3..0],carry_in);
	[carry, result[7..4]] = add4(a[7..4],b[7..4],low_carry);
	RETURN [carry, result];
END add8;

