" SEGMENT
" This procedure takes a 4-bit number and creates the 7 signals needed
" to display its decimal image on a 7-segment digit display.  
" The numbering of the segments is as follows:
"
"  0-> ---
"  5-> | | <-1
"  6-> ---
"  4-> | | <-2
"  3-> ---
"
" For values from 0-9 the corresponding digit is displayed. 
" For values from 10-15 an 'E' is displayed indicating an 
" erroneous value.
"
PROCEDURE display_digit(INPUT number[4]; OUTPUT digit[7]);

	TRUTH_TABLE
			number :: digit;  " exactly the same as: 
					      " number[3..0] :: digit[6..0]
			  "--------------
			      0:: 0111111b;
			      1:: 0000110b;
			      2:: 1011011b;
			      3:: 1001111b;
			      4:: 1100110b;
			      5:: 1101101b;
			      6:: 1111101b;
			      7:: 0000111b;
			      8:: 1111111b;
			      9:: 1101111b;
		      ELSE:: 1111100b;  " This creates the pattern for an 'E'
	END TRUTH_TABLE;
END display_digit;

" This procedure takes a 7 bit binary input value and generates two
" decimal digit values to represent the value in decimal.
" Values greater than 99 should not occur.
" Note that the CASE statements have no ELSEs.  This is because values
" greater that 99 won't be passed to this procedure.  The compiler will
" assume that the design doesn't care what values 'high' and 'low' have
" when 'value' is greater than 99.  It will take advantage of this
" assumption to generate the smallest possible equations which
" guarantee that 'high' and 'low' have the specified values when 'value'
" is less than or equal to 99.
"
PROCEDURE make_decimal(INPUT value[7]; OUTPUT high[4], low[4]);
	" Create the low order digit.
	CASE value
		WHEN 0,10,20,30,40,50,60,70,80,90=>
			low = 0;
		WHEN 1,11,21,31,41,51,61,71,81,91=>
			low = 1;
		WHEN 2,12,22,32,42,52,62,72,82,92=>
			low = 2;
		WHEN 3,13,23,33,43,53,63,73,83,93=>
			low = 3;
		WHEN 4,14,24,34,44,54,64,74,84,94=>
			low = 4;
		WHEN 5,15,25,35,45,55,65,75,85,95=>
			low = 5;
		WHEN 6,16,26,36,46,56,66,76,86,96=>
			low = 6;
		WHEN 7,17,27,37,47,57,67,77,87,97=>
			low = 7;
		WHEN 8,18,28,38,48,58,68,78,88,98=>
			low = 8;
		WHEN 9,19,29,39,49,59,69,79,89,99=>
			low = 9;
	END CASE;

	" Create the high order digit.
	CASE value
		WHEN 0..9=>
			high = 0;
		WHEN 10..19=>
			high = 1;
		WHEN 20..29=>
			high = 2;
		WHEN 30..39=>
			high = 3;
		WHEN 40..49=>
			high = 4;
		WHEN 50..59=>
			high = 5;
		WHEN 60..69=>
			high = 6;
		WHEN 70..79=>
			high = 7;
		WHEN 80..89=>
			high = 8;

	WHEN 90..99=>
			high = 9;
	END CASE;
END make_decimal;

" The following portion of the design would be accomplished by placing
" an instance of a DSL block on the schematic, and connecting an input
" port named value[7] and two output ports named digit_high[7] and
" digit_low[7] to it.  The procedures "make_decimal" and
" "display_digit" would then be called from within the block.
"
" This is the 7-bit input value.
PROCEDURE SEVEN_SEG (INPUT value[7]; 
	OUTPUT digit_high[7], digit_low[7]);

" These are intermediate values of the two decimal digits.
	NODE high_val[4], low_val[4];

" These are the 7 segment values for the two digits.

	make_decimal(value, high_val, low_val);
	display_digit(high_val, digit_high);
	display_digit(low_val, digit_low);

END SEVEN_SEG;

