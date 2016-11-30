PROCEDURE sapr_cnt( INPUT CLK, Conv;
     OUTPUT C[3..0] CLOCKED_BY CLK
     RESET_BY /Conv );

" state counter

if (c < 15) then
  c =c.+.1;
else 
  c =c;  " stick at 15..
end if;

END sapr_cnt;
