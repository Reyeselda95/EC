" GRAY2
PROCEDURE GRAY2 (INPUT clock, reset;
	OUTPUT q3, q2, q1, q0 CLOCKED_BY clock);

q3 = /reset*(Q3*/Q2*/Q1*Q0 + Q3*/Q2*Q1*Q0 + Q3*/Q2*Q1*/Q0
	+ Q3*Q2*Q1*/Q0 + Q3*Q2*Q1*Q0 + Q3*Q2*/Q1*Q0 + Q3*Q2*/Q1*/Q0
	+ /Q3*Q2*/Q1*/Q0);

q2 = /reset*(Q3*Q2*Q1*Q0 + Q3*Q2*/Q1*Q0 + Q3*Q2*/Q1*/Q0
	+ /Q3*Q2*/Q1*/Q0 	+ /Q3*Q2*/Q1*Q0 + /Q3*Q2*Q1*Q0 
	+ /Q3*Q2*Q1*/Q0 + /Q3*/Q2*Q1*/Q0);

q1 = /reset*(Q3*/Q2*Q1*/Q0 + Q3*Q2*Q1*/Q0 + Q3*Q2*Q1*Q0 + Q3*Q2*/Q1*Q0
	+ /Q3*Q2*Q1*/Q0 + /Q3*/Q2*Q1*/Q0 + /Q3*/Q2*Q1*Q0 
	+ /Q3*/Q2*/Q1*Q0);

q0 = /reset*(Q3*/Q2*Q1*Q0 + Q3*/Q2*Q1*/Q0 + Q3*Q2*/Q1*Q0 
	+ Q3*Q2*/Q1*/Q0 + /Q3*Q2*Q1*Q0 + /Q3*Q2*Q1*/Q0 + /Q3*/Q2*/Q1*Q0
	+ /Q3*/Q2*/Q1*/Q0);

END GRAY2; 

