USE 'pldprims' ;


PROCEDURE ls620( OUTPUT A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8; INPUT GBA, GAB) ;

  B1 = INVTH(A1,GAB) ;
  A1 = INVTH(B1,/GBA) ;
  B2 = INVTH(A2,GAB) ;
  A2 = INVTH(B2,/GBA) ;
  B3 = INVTH(A3,GAB) ;
  A3 = INVTH(B3,/GBA) ;
  B4 = INVTH(A4,GAB) ;
  A4 = INVTH(B4,/GBA) ;
  B5 = INVTH(A5,GAB) ;
  A5 = INVTH(B5,/GBA) ;
  B6 = INVTH(A6,GAB) ;
  A6 = INVTH(B6,/GBA) ;
  B7 = INVTH(A7,GAB) ;
  A7 = INVTH(B7,/GBA) ;
  B8 = INVTH(A8,GAB) ;
  A8 = INVTH(B8,/GBA) ;

END ls620 ;




PROCEDURE ls621( OUTPUT A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8; INPUT GBA, GAB) ;

  B8 = BUFTH(A8,GAB) ;
  B7 = BUFTH(A7,GAB) ;
  B6 = BUFTH(A6,GAB) ;
  B5 = BUFTH(A5,GAB) ;
  B4 = BUFTH(A4,GAB) ;
  B3 = BUFTH(A3,GAB) ;
  B2 = BUFTH(A2,GAB) ;
  B1 = BUFTH(A1,GAB) ;
  A8 = BUFTH(B8,/GBA) ;
  A7 = BUFTH(B7,/GBA) ;
  A6 = BUFTH(B6,/GBA) ;
  A5 = BUFTH(B5,/GBA) ;
  A4 = BUFTH(B4,/GBA) ;
  A3 = BUFTH(B3,/GBA) ;
  A2 = BUFTH(B2,/GBA) ;
  A1 = BUFTH(B1,/GBA) ;

END ls621 ;




PROCEDURE ls622( OUTPUT A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8; INPUT GBA, GAB) ;


  B1 = INVTH(A1,GAB) ;
  A1 = INVTH(B1,/GBA) ;
  B2 = INVTH(A2,GAB) ;
  A2 = INVTH(B2,/GBA) ;
  B3 = INVTH(A3,GAB) ;
  A3 = INVTH(B3,/GBA) ;
  B4 = INVTH(A4,GAB) ;
  A4 = INVTH(B4,/GBA) ;
  B5 = INVTH(A5,GAB) ;
  A5 = INVTH(B5,/GBA) ;
  B6 = INVTH(A6,GAB) ;
  A6 = INVTH(B6,/GBA) ;
  B7 = INVTH(A7,GAB) ;
  A7 = INVTH(B7,/GBA) ;
  B8 = INVTH(A8,GAB) ;
  A8 = INVTH(B8,/GBA) ;

END ls622 ;




PROCEDURE ls623( OUTPUT A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8; INPUT GBA, GAB) ;

  B8 = BUFTH(A8,GAB) ;
  B7 = BUFTH(A7,GAB) ;
  B6 = BUFTH(A6,GAB) ;
  B5 = BUFTH(A5,GAB) ;
  B4 = BUFTH(A4,GAB) ;
  B3 = BUFTH(A3,GAB) ;
  B2 = BUFTH(A2,GAB) ;
  B1 = BUFTH(A1,GAB) ;
  A8 = BUFTH(B8,/GBA) ;
  A7 = BUFTH(B7,/GBA) ;
  A6 = BUFTH(B6,/GBA) ;
  A5 = BUFTH(B5,/GBA) ;
  A4 = BUFTH(B4,/GBA) ;
  A3 = BUFTH(B3,/GBA) ;
  A2 = BUFTH(B2,/GBA) ;
  A1 = BUFTH(B1,/GBA) ;

END ls623 ;




PROCEDURE ls638( OUTPUT A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8; INPUT G, DIR) ;

  B1 = INVTH(A1,*(/G,DIR)) ;
  B2 = INVTH(A2,*(/G,DIR)) ;
  B3 = INVTH(A3,*(/G,DIR)) ;
  B4 = INVTH(A4,*(/G,DIR)) ;
  B5 = INVTH(A5,*(/G,DIR)) ;
  B6 = INVTH(A6,*(/G,DIR)) ;
  B7 = INVTH(A7,*(/G,DIR)) ;
  B8 = INVTH(A8,*(/G,DIR)) ;
  A1 = INVTH(B1,/+(G,DIR)) ;
  A2 = INVTH(B2,/+(G,DIR)) ;
  A3 = INVTH(B3,/+(G,DIR)) ;
  A4 = INVTH(B4,/+(G,DIR)) ;
  A5 = INVTH(B5,/+(G,DIR)) ;
  A6 = INVTH(B6,/+(G,DIR)) ;
  A7 = INVTH(B7,/+(G,DIR)) ;
  A8 = INVTH(B8,/+(G,DIR)) ;

END ls638 ;




PROCEDURE ls639( OUTPUT A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8; INPUT G, DIR) ;

  B8 = BUFTH(A8,*(/G,DIR)) ;
  B7 = BUFTH(A7,*(/G,DIR)) ;
  B6 = BUFTH(A6,*(/G,DIR)) ;
  B5 = BUFTH(A5,*(/G,DIR)) ;
  B4 = BUFTH(A4,*(/G,DIR)) ;
  B3 = BUFTH(A3,*(/G,DIR)) ;
  B2 = BUFTH(A2,*(/G,DIR)) ;
  B1 = BUFTH(A1,*(/G,DIR)) ;
  A8 = BUFTH(B8,/+(G,DIR)) ;
  A7 = BUFTH(B7,/+(G,DIR)) ;
  A6 = BUFTH(B6,/+(G,DIR)) ;
  A5 = BUFTH(B5,/+(G,DIR)) ;
  A4 = BUFTH(B4,/+(G,DIR)) ;
  A3 = BUFTH(B3,/+(G,DIR)) ;
  A2 = BUFTH(B2,/+(G,DIR)) ;
  A1 = BUFTH(B1,/+(G,DIR)) ;

END ls639 ;




PROCEDURE ls640( OUTPUT A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8; INPUT G, DIR) ;

  B1 = INVTH(A1,*(/G,DIR)) ;
  A1 = INVTH(B1,/+(G,DIR)) ;
  B2 = INVTH(A2,*(/G,DIR)) ;
  A2 = INVTH(B2,/+(G,DIR)) ;
  B3 = INVTH(A3,*(/G,DIR)) ;
  A3 = INVTH(B3,/+(G,DIR)) ;
  B4 = INVTH(A4,*(/G,DIR)) ;
  A4 = INVTH(B4,/+(G,DIR)) ;
  B5 = INVTH(A5,*(/G,DIR)) ;
  A5 = INVTH(B5,/+(G,DIR)) ;
  B6 = INVTH(A6,*(/G,DIR)) ;
  A6 = INVTH(B6,/+(G,DIR)) ;
  B7 = INVTH(A7,*(/G,DIR)) ;
  A7 = INVTH(B7,/+(G,DIR)) ;
  B8 = INVTH(A8,*(/G,DIR)) ;
  A8 = INVTH(B8,/+(G,DIR)) ;

END ls640 ;




PROCEDURE ls641( OUTPUT A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8; INPUT G, DIR) ;

  B8 = BUFTH(A8,*(/G,DIR)) ;
  B7 = BUFTH(A7,*(/G,DIR)) ;
  B6 = BUFTH(A6,*(/G,DIR)) ;
  B5 = BUFTH(A5,*(/G,DIR)) ;
  B4 = BUFTH(A4,*(/G,DIR)) ;
  B3 = BUFTH(A3,*(/G,DIR)) ;
  B2 = BUFTH(A2,*(/G,DIR)) ;
  B1 = BUFTH(A1,*(/G,DIR)) ;
  A8 = BUFTH(B8,/+(G,DIR)) ;
  A7 = BUFTH(B7,/+(G,DIR)) ;
  A6 = BUFTH(B6,/+(G,DIR)) ;
  A5 = BUFTH(B5,/+(G,DIR)) ;
  A4 = BUFTH(B4,/+(G,DIR)) ;
  A3 = BUFTH(B3,/+(G,DIR)) ;
  A2 = BUFTH(B2,/+(G,DIR)) ;
  A1 = BUFTH(B1,/+(G,DIR)) ;

END ls641 ;




PROCEDURE ls642( OUTPUT A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8; INPUT G, DIR) ;

  B1 = INVTH(A1,*(/G,DIR)) ;
  A1 = INVTH(B1,/+(G,DIR)) ;
  B2 = INVTH(A2,*(/G,DIR)) ;
  A2 = INVTH(B2,/+(G,DIR)) ;
  B3 = INVTH(A3,*(/G,DIR)) ;
  A3 = INVTH(B3,/+(G,DIR)) ;
  B4 = INVTH(A4,*(/G,DIR)) ;
  A4 = INVTH(B4,/+(G,DIR)) ;
  B5 = INVTH(A5,*(/G,DIR)) ;
  A5 = INVTH(B5,/+(G,DIR)) ;
  B6 = INVTH(A6,*(/G,DIR)) ;
  A6 = INVTH(B6,/+(G,DIR)) ;
  B7 = INVTH(A7,*(/G,DIR)) ;
  A7 = INVTH(B7,/+(G,DIR)) ;
  B8 = INVTH(A8,*(/G,DIR)) ;
  A8 = INVTH(B8,/+(G,DIR)) ;

END ls642 ;


PROCEDURE ls643( OUTPUT A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8; INPUT G, DIR) ;

  A1 = BUFTH(B1,/+(G,DIR)) ;
  A2 = BUFTH(B2,/+(G,DIR)) ;
  A3 = BUFTH(B3,/+(G,DIR)) ;
  A4 = BUFTH(B4,/+(G,DIR)) ;
  A5 = BUFTH(B5,/+(G,DIR)) ;
  A6 = BUFTH(B6,/+(G,DIR)) ;
  A7 = BUFTH(B7,/+(G,DIR)) ;
  A8 = BUFTH(B8,/+(G,DIR)) ;
  B1 = INVTH(A1,*(/G,DIR)) ;
  B2 = INVTH(A2,*(/G,DIR)) ;
  B3 = INVTH(A3,*(/G,DIR)) ;
  B4 = INVTH(A4,*(/G,DIR)) ;
  B5 = INVTH(A5,*(/G,DIR)) ;
  B6 = INVTH(A6,*(/G,DIR)) ;
  B7 = INVTH(A7,*(/G,DIR)) ;
  B8 = INVTH(A8,*(/G,DIR)) ;

END ls643 ;


PROCEDURE ls644( OUTPUT A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8; INPUT G, DIR) ;

  A1 = BUFTH(B1,/+(G,DIR)) ;
  A2 = BUFTH(B2,/+(G,DIR)) ;
  A3 = BUFTH(B3,/+(G,DIR)) ;
  A4 = BUFTH(B4,/+(G,DIR)) ;
  A5 = BUFTH(B5,/+(G,DIR)) ;
  A6 = BUFTH(B6,/+(G,DIR)) ;
  A7 = BUFTH(B7,/+(G,DIR)) ;
  A8 = BUFTH(B8,/+(G,DIR)) ;
  B1 = INVTH(A1,*(/G,DIR)) ;
  B2 = INVTH(A2,*(/G,DIR)) ;
  B3 = INVTH(A3,*(/G,DIR)) ;
  B4 = INVTH(A4,*(/G,DIR)) ;
  B5 = INVTH(A5,*(/G,DIR)) ;
  B6 = INVTH(A6,*(/G,DIR)) ;
  B7 = INVTH(A7,*(/G,DIR)) ;
  B8 = INVTH(A8,*(/G,DIR)) ;

END ls644 ;




PROCEDURE ls645( OUTPUT A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8; INPUT G, DIR) ;

  B8 = BUFTH(A8,*(/G,DIR)) ;
  B7 = BUFTH(A7,*(/G,DIR)) ;
  B6 = BUFTH(A6,*(/G,DIR)) ;
  B5 = BUFTH(A5,*(/G,DIR)) ;
  B4 = BUFTH(A4,*(/G,DIR)) ;
  B3 = BUFTH(A3,*(/G,DIR)) ;
  B2 = BUFTH(A2,*(/G,DIR)) ;
  B1 = BUFTH(A1,*(/G,DIR)) ;
  A8 = BUFTH(B8,/+(G,DIR)) ;
  A7 = BUFTH(B7,/+(G,DIR)) ;
  A6 = BUFTH(B6,/+(G,DIR)) ;
  A5 = BUFTH(B5,/+(G,DIR)) ;
  A4 = BUFTH(B4,/+(G,DIR)) ;
  A3 = BUFTH(B3,/+(G,DIR)) ;
  A2 = BUFTH(B2,/+(G,DIR)) ;
  A1 = BUFTH(B1,/+(G,DIR)) ;

END ls645 ;


