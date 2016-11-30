" GRAY4

PROCEDURE GRAY4 (INPUT clock, reset;
	OUTPUT q[4] CLOCKED_BY clock);

IF reset THEN
	q = 0;
ELSE
	TRUTH_TABLE
		q   ::   q;
		"--------------
		0000b :: 0001b;
		0001b :: 0011b;
		0011b :: 0010b;
		0010b :: 0110b;
		0110b :: 0111b;
		0111b :: 0101b;
		0101b :: 0100b;
		0100b :: 1100b;
		1100b :: 1101b;
		1101b :: 1111b;
		1111b :: 1110b;
		1110b :: 1010b;
		1010b :: 1011b;
		1011b :: 1001b;
		1001b :: 1000b;
		1000b :: 0000b;
	END TRUTH_TABLE;
END IF;

END GRAY4;

