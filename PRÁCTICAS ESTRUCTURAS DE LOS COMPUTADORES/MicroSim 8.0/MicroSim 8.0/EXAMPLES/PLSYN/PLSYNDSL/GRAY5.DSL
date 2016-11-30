" GRAY5

PROCEDURE GRAY5 (INPUT clock, reset;
	OUTPUT q[4] CLOCKED_BY clock);

IF reset THEN
	q = 0;
ELSE
	CASE q
		WHEN 0000b=>
			q = 0001b;
		WHEN 0001b=>
			q = 0011b;
		WHEN 0011b=>
			q = 0010b;
		WHEN 0010b=>
			q = 0110b;
		WHEN 0110b=>
			q = 0111b;
		WHEN 0111b=>
			q = 0101b;
		WHEN 0101b=>
			q = 0100b;
		WHEN 0100b=>
			q = 1100b;
		WHEN 1100b=>
			q = 1101b;
		WHEN 1101b=>
			q = 1111b;
		WHEN 1111b=>
			q = 1110b;
		WHEN 1110b=>
			q = 1010b;
		WHEN 1010b=>
			q = 1011b;
		WHEN 1011b=>
			q = 1001b;
		WHEN 1001b=>
			q = 1000b;
		WHEN 1000b=>
			q = 0000b;
	END CASE;
END IF;

END GRAY5;

