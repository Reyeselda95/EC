" MULT1
"
" This USE clause causes the definition of the 'add4' FUNCTION to be
" brought in from library 'adder2' (assume that the previous adder
" FUNCTION example was in file 'adder2.dsl').  This is functionally
" the same as if the 'add4' FUNCTION were written here.  However, 
" USEing a PROCEDURE or FUNCTION compiles faster than writing it again
" since is has already been compiled.
"
USE 'adder2'.add4;
"
" 4-bit multiplier implemented with combinatorial logic.
"
FUNCTION mult(x[4], y[4])[8];
	" These arrays are used to hold the intermediate results.
	" The bit numbering corresponds to bit positions in the 
	" 8-bit product.
	NODE temp0[4..0], temp1[5..1], temp2[6..2], temp3[7..3];

	" This implements a simple shift-add multiply scheme, although the
	" entire multiply is done combinatorially.
	IF y[0] THEN
		temp0 = [0, x];
	ELSE
		temp0 = 0;
	END IF;
	IF y[1] THEN
		temp1 = add4(temp0[4..1], x, 0);
	ELSE
		temp1 = [0, temp0[4..1]];
	END IF;
	IF y[2] THEN
		temp2 = add4(temp1[5..2], x, 0);
	ELSE
		temp2 = [0, temp1[5..2]];
	END IF;
	IF y[3] THEN
		temp3 = add4(temp2[6..3], x, 0);
	ELSE
		temp3 = [0, temp2[6..3]];
	END IF;
	RETURN [temp3, temp2[2], temp1[1], temp0[0]];
END mult;

