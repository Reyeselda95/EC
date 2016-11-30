USE 'pldprims' ;

	MACRO VCC 1 ;
	MACRO GND 0 ;

PROCEDURE ls445( OUTPUT O0, O1, O2, O3, O4, O5, O6, O7, O8, O9; INPUT A, B, C, D) ;

  O0 = /*(/A,/B,/C,/D) ;
  O1 = /*(A,/B,/C,/D) ;
  O2 = /*(/A,B,/C,/D) ;
  O3 = /*(A,B,/C,/D) ;
  O5 = /*(A,/B,C,/D) ;
  O6 = /*(/A,B,C,/D) ;
  O7 = /*(A,B,C,/D) ;
  O8 = /*(/A,/B,/C,D) ;
  O9 = /*(A,/B,/C,D) ;
  O4 = /*(/A,/B,C,/D) ;

END ls445 ;




PROCEDURE ls465( OUTPUT Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8; INPUT G1, G2, A1, A2, A3, A4, 
        A5, A6, A7, A8) ;

  Y1 = BUFTH(A1,/+(G1,G2)) ;
  Y2 = BUFTH(A2,/+(G1,G2)) ;
  Y3 = BUFTH(A3,/+(G1,G2)) ;
  Y4 = BUFTH(A4,/+(G1,G2)) ;
  Y5 = BUFTH(A5,/+(G1,G2)) ;
  Y6 = BUFTH(A6,/+(G1,G2)) ;
  Y7 = BUFTH(A7,/+(G1,G2)) ;
  Y8 = BUFTH(A8,/+(G1,G2)) ;

END ls465 ;




PROCEDURE ls466( OUTPUT Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8; INPUT G1, G2, A1, A2, A3, A4, 
        A5, A6, A7, A8) ;

  Y8 = INVTH(A8,/+(G1,G2)) ;
  Y7 = INVTH(A7,/+(G1,G2)) ;
  Y6 = INVTH(A6,/+(G1,G2)) ;
  Y5 = INVTH(A5,/+(G1,G2)) ;
  Y4 = INVTH(A4,/+(G1,G2)) ;
  Y3 = INVTH(A3,/+(G1,G2)) ;
  Y2 = INVTH(A2,/+(G1,G2)) ;
  Y1 = INVTH(A1,/+(G1,G2)) ;

END ls466 ;




PROCEDURE ls467( OUTPUT Y1_A, Y2_A, Y3_A, Y4_A, Y1_B, Y2_B, Y3_B, Y4_B; 
				 INPUT G_A, A1_A, A2_A, A3_A, A4_A, G_B, A1_B, A2_B, A3_B, A4_B) ;

  Y1_A = BUFTH(A1_A,/G_A) ;
  Y2_A = BUFTH(A2_A,/G_A) ;
  Y3_A = BUFTH(A3_A,/G_A) ;
  Y4_A = BUFTH(A4_A,/G_A) ;

  Y1_B = BUFTH(A1_B,/G_B) ;
  Y2_B = BUFTH(A2_B,/G_B) ;
  Y3_B = BUFTH(A3_B,/G_B) ;
  Y4_B = BUFTH(A4_B,/G_B) ;

END ls467 ;


PROCEDURE ls468( OUTPUT Y1_A, Y2_A, Y3_A, Y4_A, Y1_B, Y2_B, Y3_B, Y4_B; 
				 INPUT G_A, A1_A, A2_A, A3_A, A4_A, G_B, A1_B, A2_B, A3_B, A4_B) ;

  Y1_A = INVTH(A1_A,/G_A) ;
  Y2_A = INVTH(A2_A,/G_A) ;
  Y3_A = INVTH(A3_A,/G_A) ;
  Y4_A = INVTH(A4_A,/G_A) ;

  Y1_B = INVTH(A1_B,/G_B) ;
  Y2_B = INVTH(A2_B,/G_B) ;
  Y3_B = INVTH(A3_B,/G_B) ;
  Y4_B = INVTH(A4_B,/G_B) ;

END ls468 ;




PROCEDURE ls490( OUTPUT QA_A, QB_A, QC_A, QD_A; INPUT SET9_A, CLK_A, CLR_A) ;
				 
  NODE N00006_A ;
  NODE N00007_A ;
  NODE N00008_A ;
  NODE N00009_A ;
  NODE N00010_A ;
  NODE N00011_A ;
  NODE N00014_A ;
  NODE N00015_A ;
  NODE N00016_A ;
  NODE N00018_A ;
  NODE N00019_A ;
  NODE N00020_A ;
  NODE N00021_A ;
  NODE N00022_A ;
  NODE NOCONN_1_A ;

  N00006_A = PORTNODE(N00007_A) ;
  N00019_A = PORTNODE(N00020_A) ;
  N00011_A = PORTNODE(N00010_A) ;
  N00016_A = PORTNODE(N00015_A) ;
  N00018_A = *(N00009_A,N00008_A) ;
  N00022_A = *(N00008_A,N00014_A) ;
  N00015_A = *(/SET9_A,/CLR_A) ;
  N00010_A = *(/SET9_A,/CLR_A) ;
  DFFR(QC_A,N00014_A,/QC_A,/QB_A,N00016_A) ;
  DFFR(QB_A,N00009_A,/QB_A,N00006_A,N00011_A) ;
  DFFRS(QA_A,NOCONN_1_A,/QA_A,/CLK_A,/CLR_A,/SET9_A) ;
  DFFRS(QD_A,N00008_A,/QD_A,N00019_A,/CLR_A,/SET9_A) ;
  N00020_A = /*(QA_A,N00021_A) ;
  N00007_A = /*(QA_A,N00008_A) ;
  N00021_A = /+(N00018_A,N00022_A) ;

END ls490 ;
