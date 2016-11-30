" GRAY1

PROCEDURE GRAY1 (INPUT clock, reset;
	OUTPUT q3, q2, q1, q0 CLOCKED_BY clock RESET_BY reset);

q3 = Q3*/Q2*/Q1*Q0 + Q3*/Q2*Q1*Q0 + Q3*/Q2*Q1*/Q0 + Q3*Q2*Q1*/Q0
	+ Q3*Q2*Q1*Q0 + Q3*Q2*/Q1*Q0 + Q3*Q2*/Q1*/Q0 + /Q3*Q2*/Q1*/Q0;

q2 = Q3*Q2*Q1*Q0 + Q3*Q2*/Q1*Q0 + Q3*Q2*/Q1*/Q0 + /Q3*Q2*/Q1*/Q0
	+ /Q3*Q2*/Q1*Q0 + /Q3*Q2*Q1*Q0 + /Q3*Q2*Q1*/Q0 + /Q3*/Q2*Q1*/Q0;

q1 = Q3*/Q2*Q1*/Q0 + Q3*Q2*Q1*/Q0 + Q3*Q2*Q1*Q0 + Q3*Q2*/Q1*Q0
	+ /Q3*Q2*Q1*/Q0 + /Q3*/Q2*Q1*/Q0 + /Q3*/Q2*Q1*Q0 + /Q3*/Q2*/Q1*Q0;

q0 = Q3*/Q2*Q1*Q0 + Q3*/Q2*Q1*/Q0 + Q3*Q2*/Q1*Q0 + Q3*Q2*/Q1*/Q0
	+ /Q3*Q2*Q1*Q0 + /Q3*Q2*Q1*/Q0 + /Q3*/Q2*/Q1*Q0 + /Q3*/Q2*/Q1*/Q0;

END GRAY1;

