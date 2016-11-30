
" GRAY6

PROCEDURE GRAY6 (INPUT clock, reset;
	OUTPUT q[4] CLOCKED_BY clock);

IF reset THEN
	q = 0;
ELSE
	IF q = 0000b THEN
		q = 0001b;
	ELSIF q = 0001b THEN
		q = 0011b;
	ELSIF q = 0011b THEN
		q = 0010b;
	ELSIF q = 0010b THEN
		q = 0110b;
	ELSIF q = 0110b THEN
		q = 0111b;
	ELSIF q = 0111b THEN
		q = 0101b;
	ELSIF q = 0101b THEN
		q = 0100b;
	ELSIF q = 0100b THEN
		q = 1100b;
	ELSIF q = 1100b THEN
		q = 1101b;
	ELSIF q = 1101b THEN
		q = 1111b;
	ELSIF q = 1111b THEN
		q = 1110b;
	ELSIF q = 1110b THEN
		q = 1010b;
	ELSIF q = 1010b THEN
		q = 1011b;
	ELSIF q = 1011b THEN
		q = 1001b;
	ELSIF q = 1001b THEN
		q = 1000b;
	ELSIF q = 1000b THEN
		q = 0000b;
	END IF;
END IF;

END GRAY6;

