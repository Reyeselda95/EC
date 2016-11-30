" 4-Bit ALU example
"

" reg_file
"
"   This procedure implements the 16x4 register file with 2 read ports
"   and one write port.
"
"     reg_op -- operation to perform -- either no store (Nop) or
"               store b_in to addressed register (f_to_b)
"     a_addr -- address of the register that appears on the a_out port
"     b_addr -- address of the regsiter on the a_out port and also
"               the address to write into from the b_in port
"     b_in   -- input port for writing data
"     cp     -- clock signal for the registers
"     a_out  -- a output port
"     b_out  -- b output port
"

MACRO Nop    0;
MACRO f_to_b 1;

PROCEDURE reg_file( INPUT reg_op, a_addr[4], b_addr[4], b_in[4], cp;
    OUTPUT a_out[4], b_out[4] );

    NODE reg0[4], reg1[4], reg2[4], reg3[4] CLOCKED_BY cp;
    NODE reg4[4], reg5[4], reg6[4], reg7[4] CLOCKED_BY cp;
    NODE reg8[4], reg9[4], reg10[4], reg11[4] CLOCKED_BY cp;
    NODE reg12[4], reg13[4], reg14[4], reg15[4] CLOCKED_BY cp;

    CASE a_addr
        WHEN  0=>  a_out = reg0;
        WHEN  1=>  a_out = reg1;
        WHEN  2=>  a_out = reg2;
        WHEN  3=>  a_out = reg3;
        WHEN  4=>  a_out = reg4;
        WHEN  5=>  a_out = reg5;
        WHEN  6=>  a_out = reg6;
        WHEN  7=>  a_out = reg7;
        WHEN  8=>  a_out = reg8;
        WHEN  9=>  a_out = reg9;
        WHEN 10=>  a_out = reg10;
        WHEN 11=>  a_out = reg11;
        WHEN 12=>  a_out = reg12;
        WHEN 13=>  a_out = reg13;
        WHEN 14=>  a_out = reg14;
        WHEN 15=>  a_out = reg15;
    END CASE;

    CASE b_addr
        WHEN  0=>  b_out = reg0;
        WHEN  1=>  b_out = reg1;
        WHEN  2=>  b_out = reg2;
        WHEN  3=>  b_out = reg3;
        WHEN  4=>  b_out = reg4;
        WHEN  5=>  b_out = reg5;
        WHEN  6=>  b_out = reg6;
        WHEN  7=>  b_out = reg7;
        WHEN  8=>  b_out = reg8;
        WHEN  9=>  b_out = reg9;
        WHEN 10=>  b_out = reg10;
        WHEN 11=>  b_out = reg11;
        WHEN 12=>  b_out = reg12;
        WHEN 13=>  b_out = reg13;
        WHEN 14=>  b_out = reg14;
        WHEN 15=>  b_out = reg15;
    END CASE;

    IF reg_op = f_to_b THEN
        CASE b_addr
            WHEN  0=> [reg0..reg15] = [b_in,reg1..reg15];
            WHEN  1=> [reg0..reg15] = [reg0,b_in,reg2..reg15];
            WHEN  2=> [reg0..reg15] = [reg0,reg1,b_in,reg3..reg15];
            WHEN  3=> [reg0..reg15] = [reg0..reg2,b_in,reg4..reg15];
            WHEN  4=> [reg0..reg15] = [reg0..reg3,b_in,reg5..reg15];
            WHEN  5=> [reg0..reg15] = [reg0..reg4,b_in,reg6..reg15];
            WHEN  6=> [reg0..reg15] = [reg0..reg5,b_in,reg7..reg15];
            WHEN  7=> [reg0..reg15] = [reg0..reg6,b_in, reg8..reg15];
            WHEN  8=> [reg0..reg15] = [reg0..reg7,b_in,reg9..reg15];
            WHEN  9=> [reg0..reg15] = [reg0..reg8,b_in,reg10..reg15];
            WHEN 10=> [reg0..reg15] = [reg0..reg9,b_in,reg11..reg15];
            WHEN 11=> [reg0..reg15] = [reg0..reg10,b_in,reg12..reg15];
            WHEN 12=> [reg0..reg15] = [reg0..reg11,b_in,reg13..reg15];
            WHEN 13=> [reg0..reg15] = [reg0..reg12,b_in,reg14..reg15];
            WHEN 14=> [reg0..reg15] = [reg0..reg13,b_in,reg15];
            WHEN 15=> [reg0..reg15] = [reg0..reg14,b_in];
        END CASE;
    ELSE " must be Nop
        [reg0..reg15] = [reg0..reg15];
    END IF;
END reg_file;

"
" The shifter appears in two places, as the input to the
" register file and as part of the Q-register loop.
"
"    dir   -- direction of shift:
"                 Pass -- no shift
"                 Up   -- shift left
"                 Down -- shift right
"    in    -- 4-bit input value
"    in_l  -- low bit to shift in if left shift
"    in_h  -- high bit to shift in if right shift
"    out   -- 4-bit output value
"    out_l -- output of low bit if right shift
"    out_h -- output of high bit if left shift
"

MACRO Pass 0;
MACRO Up   1;
MACRO Down 2;

PROCEDURE shifter( INPUT dir[2], in[4], in_l, in_h;
    OUTPUT out[4], out_l, out_h );

    CASE dir
        WHEN Pass=>
            out = in;
            out_l = in_l;
            out_h = in_h;
        WHEN Up=>
            [out_h,out,out_l] = [in,in_l,in_l];
        WHEN Down=>
            [out_h,out,out_l] = [in_h,in_h,in];
    ELSE
        [out_h,out,out_l] = [in_h,in,in_l];
    END CASE;
END shifter;

"
" The Q-register is a temporary 4-bit register
"
"    cp     -- clock signal for registers
"    q_op   -- operation select
"                 Nop    -- no operation on Q
"                 q_to_q -- update Q from Q via the shifter
"                 f_to_q -- store the f input into Q
"    f      -- 4-bit input register
"    q_in   -- 4-bit input from the Q shifter
"    q_out  -- 4-bit output to select mux and Q shifter
"

" MACRO Nop  0;
MACRO q_to_q  1;
MACRO f_to_q  2;

PROCEDURE Q_reg( INPUT cp, q_op[2], f[4], q_in[4]; OUTPUT q_out[4] );

    NODE q[4] CLOCKED_BY cp;

    q_out = q;
    CASE q_op
        WHEN f_to_q=>  q = f;
        WHEN q_to_q=>  q = q_in;
    ELSE
        q = q;
    END CASE;

END Q_reg;

"
" Alu data sel selects the data for the alu A and B inputs
"
"    sel    -- select input, one of the following=>
"                  AQ --   r <- A, s <- Q
"                  AB --   r <- A, s <- B
"                  ZQ --   r <- 0, s <- Q
"                  ZB --   r <- 0, s <- B
"                  ZA --   r <- 0, s <- A
"                  DA --   r <- D, s <- A
"                  DQ --   r <- D, s <- Q
"                  DZ --   r <- D, s <- 0
"    a      -- 4-bit a input
"    b      -- 4-bit b input
"    q      -- 4-bit q input
"    d      -- 4-bit d input
"    r      -- 4-bit r output
"    s      -- 4-bit s output
"

MACRO AQ 0;
MACRO AB 1;
MACRO ZQ 2;
MACRO ZB 3;
MACRO ZA 4;
MACRO DA 5;
MACRO DQ 6;
MACRO DZ 7;

PROCEDURE Alu_data_sel( INPUT sel[3], a[4], b[4], q[4], d[4];
    OUTPUT r[4], s[4] );

    CASE sel
        WHEN AQ=> r = a; s = q;
        WHEN AB=> r = a; s = b;
        WHEN ZQ=> r = 0; s = q;
        WHEN ZB=> r = 0; s = b;
        WHEN ZA=> r = 0; s = a;
        WHEN DA=> r = d; s = a;
        WHEN DQ=> r = d; s = q;
        WHEN DZ=> r = d; s = 0;
    END CASE;
END Alu_data_sel;

"
"  Alu implements a 4-bit 8-function alu
"
"   Alu opcodes:
"
"     xADD    ADD     r+s
"     xSUBR   SUBR    r-s
"     xSUBS   SUBS    s-r
"     xOR     OR      r | s
"     xAND    AND     r & s
"     xNOTRS  NOTRS   ~r & s
"     xEXOR   EXOR    r ^ s
"     xEXNOR  EXNOR   ~(r ^ s)
"

MACRO xADD   0;
MACRO xSUBR  1;
MACRO xSUBS  2;
MACRO xOR    3;
MACRO xAND   4;
MACRO xNOTRS 5;
MACRO xEXOR  6;
MACRO xEXNOR 7;

"
"  add_op -- implement the add operator
"
"     Cin    -- carry in
"     r      -- 4-bit r input
"     s      -- 4-bit s input
"     f      -- 4-bit sum
"     Cout   -- Carry out
"     G      -- generate output
"     P      -- propagate output
"     Ov     -- overflow output
"

PROCEDURE add_op( INPUT Cin, r[4], s[4];
    OUTPUT f[4], Cout, G, P, Ov );

    NODE g0,g1,g2,g3;
    NODE p0,p1,p2,p3;
    NODE c4,c3,c2,c1;
    NODE f3,f2,f1,f0;
    NODE gx, px, o;

    g0 = r[0]*s[0]; g1 = r[1]*s[1]; g2 = r[2]*s[2]; g3 = r[3]*s[3];
    p0 = r[0]+s[0]; p1 = r[1]+s[1]; p2 = r[2]+s[2]; p3 = r[3]+s[3]; 
    c1 = r[0]*s[0] + r[0]*Cin + s[0]*Cin;
    c2 = r[1]*s[1] + r[1]*c1 + s[1]*c1;
    c3 = r[2]*s[2] + r[2]*c2 + s[2]*c2;
    c4 = r[3]*s[3] + r[3]*c3 + s[3]*c3;
    f0 = r[0] (+) s[0] (+) Cin;
    f1 = r[1] (+) s[1] (+) c1;
    f2 = r[2] (+) s[2] (+) c2;
    f3 = r[3] (+) s[3] (+) c3;

    f = [f3,f2,f1,f0];
    gx = /+(g3,p3*g2,p3*p2*g1,p3*p2*p1*g0);
    px = /*(p3,p2,p1,p0);
    Cout = c4;
    o = c3 (+) c4;
    G = gx;
    P = px;
    Ov = o;
END add_op;

"
"  or_op -- implement the logical or operator
"
"     Cin    -- carry in
"     r      -- 4-bit r input
"     s      -- 4-bit s input
"     f      -- 4-bit logical sum 
"     Cout   -- Carry out
"     G      -- generate output
"     P      -- propagate output
"     Ov     -- overflow output
"

PROCEDURE or_op( INPUT Cin, r[4], s[4];
    OUTPUT f[4], Cout, G, P, Ov );

    NODE p0,p1,p2,p3;
    NODE f3,f2,f1,f0;
    NODE gx, px, o, c;

    p0 = r[0]+s[0]; p1 = r[1]+s[1]; p2 = r[2]+s[2]; p3 = r[3]+s[3]; 
    f0 = r[0] + s[0];
    f1 = r[1] + s[1];
    f2 = r[2] + s[2];
    f3 = r[3] + s[3];

    f = [f3,f2,f1,f0];
    gx = p3*p2*p1*p0;
    px = 0;
    c = /*(p3,p2,p1,p0) + Cin;
    o = /*(p3,p2,p1,p0) + Cin;
    Cout = c;
    G = gx;
    P = px;
    Ov = o;
END or_op;

"
"  and_op -- implement the logical and operator
"
"     Cin    -- carry in
"     r      -- 4-bit r input
"     s      -- 4-bit s input
"     f      -- 4-bit logical product 
"     Cout   -- Carry out
"     G      -- generate output
"     P      -- propagate output
"     Ov     -- overflow output
"

PROCEDURE and_op( INPUT Cin, r[4], s[4];
    OUTPUT f[4], Cout, G, P, Ov );

    NODE g0,g1,g2,g3;
    NODE f3,f2,f1,f0;
    NODE gx, px, o, c;

    g0 = r[0]*s[0]; g1 = r[1]*s[1]; g2 = r[2]*s[2]; g3 = r[3]*s[3];
    f0 = r[0] * s[0];
    f1 = r[1] * s[1];
    f2 = r[2] * s[2];
    f3 = r[3] * s[3];

    f = [f3,f2,f1,f0];
    gx = /(g0 + g1 + g2 + g3);
    px = 0;
    c = g3 + g2 + g1 + g0 + Cin;
    o = g3 + g2 + g1 + g0 + Cin;
    G = gx;
    P = px;
    Ov = o;
    Cout = c;
END and_op;

"
"  xnor_op -- implement the logical xnor (equivalence) operator
"
"     Cin    -- carry in
"     r      -- 4-bit r input
"     s      -- 4-bit s input
"     f      -- 4-bit logical equivalence 
"     Cout   -- Carry out
"     G      -- generate output
"     P      -- propagate output
"     Ov     -- overflow output
"

PROCEDURE xnor_op( INPUT Cin, r[4], s[4];
    OUTPUT f[4], Cout, G, P, Ov );

    NODE g0,g1,g2,g3;
    NODE p0,p1,p2,p3;
    NODE f3,f2,f1,f0;
    NODE ov1, ov2;
    NODE gx, px, o, c;

    g0 = r[0]*s[0]; g1 = r[1]*s[1]; g2 = r[2]*s[2]; g3 = r[3]*s[3];
    p0 = r[0]+s[0]; p1 = r[1]+s[1]; p2 = r[2]+s[2]; p3 = r[3]+s[3]; 
    f0 = /(r[0] (+) s[0]);
    f1 = /(r[1] (+) s[1]);
    f2 = /(r[2] (+) s[2]);
    f3 = /(r[3] (+) s[3]);

    f = [f3,f2,f1,f0];
    gx = g3 + p3*g2 + p3*p2*g1 + p3*p2*p1*g0;
    px = g3 + g2 + g1 + g0;
    c = /+( g3, p3*g2, p3*p2*g1, p3*p2*p1*p0*(g0+Cin) );
    ov1 = p2 + g2*p1 + /g2*/g1*/p0 + /g2*/g1*/g0*Cin;
    ov2 = /p3 + /g3*/p2 + /g3*/g2*/p1 + /g3*/g2*/g1*/p0 + /g3*/g2*/g1*/g0*Cin;
    o = ov1 (+) ov2;
    G = gx;
    P = px;
    Ov = o;
    Cout = c;
END xnor_op;

"
"  alu -- implement alu
"
"   op     -- operation to perform -- see opcodes above
"   Cin    -- carry in
"   r      -- 4-bit r input
"   s      -- 4-bit s input
"   f      -- 4-bit function result output
"   Cout   -- carry out
"   G_     -- generate output
"   P_     -- propagate output
"   sign   -- sign of the result -- f[3]
"   Ov     -- overflow output
"   Zero   -- asserted if f[0]..f[3] all zero
"

PROCEDURE alu( INPUT op[3], Cin, r[4], s[4];
    OUTPUT f[4], Cout, G_, P_, sign, Ov, Zero );

    NODE fx[4];
    NODE g, p, o;

    CASE op
        WHEN xADD=>   add_op( Cin, r, s, fx, Cout, g, p, o );
        WHEN xSUBR=>  add_op( Cin, r, /s, fx, Cout, g, p, o );
        WHEN xSUBS=>  add_op( Cin, /r, s, fx, Cout, g, p, o );
        WHEN xOR=>    or_op( Cin, r, s, fx, Cout, g, p, o );
        WHEN xAND=>   and_op( Cin, r, s, fx, Cout, g, p, o );
        WHEN xNOTRS=> and_op( Cin, /r, s, fx, Cout, g, p, o );
        WHEN xEXOR=>  xnor_op( Cin, /r, s, fx, Cout, g, p, o );
        WHEN xEXNOR=> xnor_op( Cin, r, s, fx, Cout, g, p, o );
    END CASE;

    sign = fx[3];
    Zero = /(fx[3]+fx[2]+fx[1]+fx[0]);
    f = fx;
    G_ = g;
    P_ = p;
    Ov = o;

END alu;

"
" Output Data Selector
"
"    outsel   -- output selection:
"                   a_to_y => y <- a
"                   f_to_y => y <- f
"    a        -- 4-bit a input
"    f        -- 4-bit f input
"    y        -- 4-bit y output
"

MACRO a_to_y 0;
MACRO f_to_y 1;

PROCEDURE Out_select( INPUT outsel, a[4], f[4]; OUTPUT y[4] );

    CASE outsel
        WHEN a_to_y=> y = a;
        WHEN f_to_y=> y = f;
    END CASE;
END Out_select;

"
" Destination decode
"
"   Decode the destination information and generate control signals
"   for the various components related to destination control.
"
"
"   op      -- destination opcode:
"                xQREG  move f to q and y, no store or shift
"                xNOP   move f to y, no store or shift
"                xRAMA  move a to y, store a in reg_file, no shift, Q nop
"                xRAMF  move f to y, store f in reg_file, no shift, Q nop
"                xRAMQD f to reg_file shifted right, and Q shifted right
"                xRAMD  f to reg_file shifted right, Q nop
"                xRAMQU f to reg_file shifted left, and Q shifted left
"                xRAMU  f to reg_file shifted left, Q nop
"   Rop     -- reg_file control signal
"   Rshift  -- reg_file shifter direction control
"   Qop     -- Q register control signals
"   Qshift  -- Q register shifter direction control
"   Yop     -- Y output mux selection control
"

MACRO xQREG  0;
MACRO xNOP   1;
MACRO xRAMA  2;
MACRO xRAMF  3;
MACRO xRAMQD 4;
MACRO xRAMD  5;
MACRO xRAMQU 6;
MACRO xRAMU  7;

PROCEDURE DestDecode(INPUT op[3];
                     OUTPUT Rop, Rshift[2], Qop[2], Qshift[2], Yop);
    TRUTH_TABLE
         op     ::     Rop,   Rshift,        Qop,   Qshift,      Yop;
        xQREG   ::     Nop,     Pass,     f_to_q,     Pass,   f_to_y;
        xNOP    ::     Nop,     Pass,        Nop,     Pass,   f_to_y;
        xRAMA   ::  f_to_b,     Pass,        Nop,     Pass,   a_to_y;
        xRAMF   ::  f_to_b,     Pass,        Nop,     Pass,   f_to_y;
        xRAMQD  ::  f_to_b,     Down,     q_to_q,     Down,   f_to_y;
        xRAMD   ::  f_to_b,     Down,        Nop,     Pass,   f_to_y;
        xRAMQU  ::  f_to_b,       Up,     q_to_q,       Up,   f_to_y;
        xRAMU   ::  f_to_b,       Up,        Nop,     Pass,   f_to_y;
    END TRUTH_TABLE;
END DestDecode;

"
" The following instantiations connect the components together to
" form the 7C901
"
"     uop      -- 901 opcode:
"                   ----------------------------------------------
"                   | i8 | i7 | i6 | i5 | i4 | i3 | i2 | i1 | i0 |
"                   ----------------------------------------------
"                   |              |              |              |
"                   | dst control  | alu function |  alu source  |
"
"     a_addr   -- reg_file a address (a output)
"     b_addr   -- reg_file b address (b output and b_in store)
"     Rin0     -- reg_file shifter low-order in bit
"     Rin3     -- reg_file shifter high-order in bit
"     Qin0     -- Q register low-order in bit
"     Qin3     -- Q register high_order in bit
"     Cin      -- carry in from previous stage
"     OE       -- Y-output three-state control
"     d        -- direct data input (4-bits)
"     cp       -- synchronous clocking signal
"     y_out    -- 4-bit output (three-state controlled)
"     Rout0    -- reg_file shifter low-order output bit
"     Rout3    -- reg_file shifter high-order output bit
"     Qout0    -- Q register shifter low-order output bit
"     Qout3    -- Q register shifter high-order output bit
"     G_       -- carry generate output
"     P_       -- carry propagate output
"     Cout     -- carry out
"     Sign     -- sign of the operation result (f[3])
"     Ov       -- overflow result
"     Zero     -- operation result is zero
"
"  Note 1: in the device, the various shift in and out bits are combined
"	on bidirectional pins, if that were desired here, we could
"	create biput pins and connect the pins from the component to
"	the appropriate connections on the biputs.
"
"  Note 2: Some of the signals on the device are specified as low-true.
" 	If this component were to be completely internal to a device,
"	this would not matter, but if this were to be the only
"	component in a package and the pins were to have the same
"	polarity, at the top level low-true signals can be declared
"	for the pins and the internally high-true signals connected
"	to them, and the external package will show the correct
"	behavior.
"

PROCEDURE CY7C901( INPUT uop[9], a_addr[4], b_addr[4], Rin0, Rin3,
                         Qin0, Qin3, Cin, OE, d[4], cp;
                  OUTPUT y_out[4], Rout0, Rout3, Qout0, Qout3, 
                         G_, P_, Cout, Sign, Ov, Zero);

    NODE B_in[4], Qin[4];
    NODE f[4], a[4], b[4], q[4], r[4], s[4];
    NODE Rop, Rshift[2], Qop[2], Qshift[2], Yop;
    NODE y[4] ENABLED_BY oe;

    Shifter( Rshift, f, Rin0, Rin3, B_in, Rout0, Rout3 );
    Reg_File( Rop, a_addr, b_addr, B_in, cp, a, b );
    Q_reg( cp, Qop, f, Qin, q );
    Shifter( Qshift, q, Qin0, Qin3, Qin, Qout0, Qout3 );
    Alu_data_sel( uop[2..0], a, b, q, d, r, s );
    Alu( uop[5..3], Cin, r, s, f, Cout, G_, P_, sign, Ov, Zero );
    Out_select( Yop, a, f, y );
    y_out = y;
    DestDecode( uop[8..6], Rop, Rshift, Qop, Qshift, Yop );

END CY7C901;

