" ADDER1
"
" This example consists of four adder PROCEDUREs.  They implement 1-bit,
" 2-bit, 4-bit, and 8-bit adders each with carry in and carry out.
"
" This PROCEDURE implements a 1-bit adder.  The inputs 'a' and 'b' are
" the signals to be added.  The 'result' is the 1-bit result of the
" addition.  There are also a 1-bit carry in and a 1-bit carry out.
"
PROCEDURE add1(INPUT a, b, carry_in; OUTPUT result, carry);
	result = a(+)b(+)carry_in;
	carry = a*b+a*carry_in+b*carry_in;
END add1;


" This PROCEDURE implements a 2-bit adder using the 1-bit adder above.
"  The inputs 'a' and 'b' are the 2-bit arrays to be added.  The
" 'result' is the 2-bit result of the addition.  There are also a 1-bit
" carry in and a 1-bit carry out.
"
" Each call of add1 creates a separate instance of the logic described
" in add1.  The NODE is used to hold the carry out from addition of the
" low order bits.  It is used as the carry in to the addition of the
" high order bits.
"
PROCEDURE add2(INPUT a[2], b[2], carry_in; OUTPUT result[2], carry);
	NODE low_carry;

	add1(a[0], b[0], carry_in, result[0], low_carry);
	add1(a[1], b[1], low_carry, result[1], carry);
END add2;


" This PROCEDURE implements a 4-bit adder using the 2-bit adder above.
" The inputs 'a' and 'b' are the 4-bit arrays to be added.  The
" 'result' is the 4-bit result of the addition. There are also a 1-bit
" carry in and a 1-bit carry out.
"
PROCEDURE add4(INPUT a[4], b[4], carry_in; OUTPUT result[4], carry);
	NODE low_carry;

	add2(a[1..0], b[1..0], carry_in, result[1..0], low_carry);
	add2(a[3..2], b[3..2], low_carry, result[3..2], carry);
END add4;


" This PROCEDURE implements an 8-bit adder using the 4-bit adder above.
" The inputs 'a' and 'b' are the 8-bit arrays to be added.  The
"'result' is the 8-bit result of the addition.  There are also a 1-bit
" carry in and a 1-bit carry out.
"
PROCEDURE add8(INPUT a[8], b[8], carry_in; OUTPUT result[8], carry);
	NODE low_carry;

	add4(a[3..0], b[3..0], carry_in, result[3..0], low_carry);
	add4(a[7..4], b[7..4], low_carry, result[7..4], carry);
END add8;

