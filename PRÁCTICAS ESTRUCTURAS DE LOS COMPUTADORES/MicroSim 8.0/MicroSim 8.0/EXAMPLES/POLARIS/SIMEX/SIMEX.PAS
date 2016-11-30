*PADS-PCB*
*Part*
P1           bnc
Rpar         R1/4W,56
Rser         R1/4W,180
Rterm1       R1/4W,200
Rterm2       R1/4W,200
Rterm3       R1/4W,200
*Net*
*Signal*    0
Rpar.1      Rterm1.1    Rterm2.2    Rterm3.1    P1.2        
*Signal*    D
Rser.1      Rterm1.2    
*Signal*    drive
Rpar.2      Rser.2      P1.1        
*Signal*    V
Rterm2.1    Rterm3.2    
*Signal*    $N_0001
*End*
