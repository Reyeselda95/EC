PROCEDURE sapr( INPUT Clk, Cmp, C[3..0];
     OUTPUT D[11..0] CLOCKED_BY Clk 
                     DEFAULT_TO LAST_VALUE);

" Control logic for successive approximation AtoD
" converter.  Works by setting each bit from high- 
" to low-order. The bit is then set or cleared based
" on the value of the comparison between the "new"
" digital value and the input voltage.
CASE C
  WHEN  1 => D = 0;      " Reset output
  WHEN  2 => D[11] = 1;
  WHEN  3 => D[10] = 1; D[11] = Cmp;
  WHEN  4 =>  D[9] = 1; D[10] = Cmp;
  WHEN  5 =>  D[8] = 1;  D[9] = Cmp;
  WHEN  6 =>  D[7] = 1;  D[8] = Cmp;
  WHEN  7 =>  D[6] = 1;  D[7] = Cmp;
  WHEN  8 =>  D[5] = 1;  D[6] = Cmp;
  WHEN  9 =>  D[4] = 1;  D[5] = Cmp;
  WHEN 10 =>  D[3] = 1;  D[4] = Cmp;
  WHEN 11 =>  D[2] = 1;  D[3] = Cmp;
  WHEN 12 =>  D[1] = 1;  D[2] = Cmp;
  WHEN 13 =>  D[0] = 1;  D[1] = Cmp;
  WHEN 14 =>             D[0] = Cmp;
END CASE;  

END sapr;
