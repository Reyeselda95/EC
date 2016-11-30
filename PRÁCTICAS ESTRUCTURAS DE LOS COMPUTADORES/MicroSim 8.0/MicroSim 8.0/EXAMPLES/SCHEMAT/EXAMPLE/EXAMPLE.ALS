* Schematics Aliases *

.ALIASES
R_RBIAS   RBIAS(1=$N_0001 2=VDD )
R_RC1      RC1(1=OUT1 2=VDD )
R_RC2      RC2(1=OUT2 2=VDD )
R_RS2      RS2(1=$N_0002 2=0 )
R_RS1      RS1(1=$N_0004 2=$N_0003 )
Q_Q3        Q3(c=$N_0001 b=$N_0001 e=VEE )
Q_Q4        Q4(c=$N_0005 b=$N_0001 e=VEE )
Q_Q1        Q1(c=OUT1 b=$N_0003 e=$N_0005 )
Q_Q2        Q2(c=OUT2 b=$N_0002 e=$N_0005 )
C_CLOAD   CLOAD(1=OUT1 2=OUT2 )
V_V3        V3(+=VEE -=0 )
V_V2        V2(+=VDD -=0 )
V_V1        V1(+=$N_0004 -=0 )
_    _(OUT1=OUT1)
_    _(OUT2=OUT2)
_    _(VEE=VEE)
_    _(VDD=VDD)
.ENDALIASES

