----------------------------------------------------------------------------
--					
-- Copyright (c) 1990, 1991, 1992 by Synopsys, Inc.  All rights reserved.
-- 
-- This source file may be used and distributed without restriction 
-- provided that this copyright statement is not removed from the file 
-- and that any derivative work contains this copyright notice.
--
--	Package name: BV_ARITHMETIC
--
--	Purpose: 
--	 A set of functions for conversions from BIT_VECTOR to
--	 INTEGER and vice versa, as well as for arithmetic
--	 operations with bit vectors.
--
--	 This package is built in to the analyzer, so this source
--	 should not be analyzed on the Synopsys VHDL system for
--	 simulation.  It is provided for reference and portability 
--	 to other systems.
--
--	Modified to add subpgm_id attribute (SR)
--								
----------------------------------------------------------------------------

package BV_ARITHMETIC is

    -- unsigned bit vector to integer
    -- discards all bits other than rightmost wordlength-1
    FUNCTION bvtoi(x: BIT_VECTOR) RETURN INTEGER;

    -- signed bit vector to integer
    -- discards all bits other than rightmost wordlength
    FUNCTION sbvtoi(x: BIT_VECTOR) RETURN INTEGER;

    -- integer to bit_vector conversion
    -- returns bit_vector(length-1 downto 0) if length >= 0, null range otherwise
    FUNCTION itobv(x: INTEGER; length: INTEGER) RETURN BIT_VECTOR;

    -- sign extend bit vector (x) to length, length < 0 is same as length = 0
    -- returns bit_vector(length-1 downto 0)
    FUNCTION sxt(x: BIT_VECTOR; length: INTEGER) RETURN BIT_VECTOR;

    -- zero extend bit vector (x) to length, length < 0 is same as length = 0
    -- returns bit_vector(length-1 downto 0)
    FUNCTION ext(x: BIT_VECTOR; length: INTEGER) RETURN BIT_VECTOR;

    -- add left + right bit vectors, sign extending the shorter one
    -- returns bit_vector(max(left'length,right'length)-1 downto 0)
    FUNCTION "+"(left: BIT_VECTOR; right: BIT_VECTOR) RETURN BIT_VECTOR;

    -- sub left - right bit vectors, sign extending the shorter one
    -- returns bit_vector(max(left'length,right'length)-1 downto 0)
    FUNCTION "-"(left: BIT_VECTOR; right: BIT_VECTOR) RETURN BIT_VECTOR;

    -- 2's complement (negative) of bit vector (right)
    -- returns bit_vector(right'length-1 downto 0)
    FUNCTION "-"(right: BIT_VECTOR) RETURN BIT_VECTOR;

    -- absolute value of bit vector (right)
    -- returns bit_vector(right'length-1 downto 0)
    FUNCTION "abs"(right: BIT_VECTOR) RETURN BIT_VECTOR;


end BV_ARITHMETIC;

package body BV_ARITHMETIC is


    type BVUNSIGNED is array (NATURAL range <>) of BIT;
    type BVSIGNED is array (NATURAL range <>) of BIT;

    FUNCTION "+"(L: BVSIGNED; R: BVSIGNED) return BVSIGNED;
    FUNCTION "-"(L: BVSIGNED; R: BVSIGNED) return BVSIGNED;
    FUNCTION "-"(L: INTEGER; R: BVSIGNED) return BVSIGNED;
    FUNCTION "ABS"(L: BVSIGNED) return BVSIGNED;

    FUNCTION C_INTEGER(ARG: BVUNSIGNED) return INTEGER;
    FUNCTION C_INTEGER(ARG: BVSIGNED) return INTEGER;
    FUNCTION C_UNSIGNED(ARG: BVUNSIGNED; SIZE: INTEGER) return BVUNSIGNED;
    FUNCTION C_SIGNED(ARG: INTEGER; SIZE: INTEGER) return BVSIGNED;
    FUNCTION C_SIGNED(ARG: BVSIGNED; SIZE: INTEGER) return BVSIGNED;


    -- word length(number of bits in an integer on this machine)
    constant wordlength: integer := 32;

    FUNCTION bvmax(L, R: INTEGER) return INTEGER is
    begin
	if L > R then
	    return L;
	else
	    return R;
	end if;
    end;


    FUNCTION bvmin(L, R: INTEGER) return INTEGER is
    begin
	if L < R then
	    return L;
	else
	    return R;
	end if;
    end;


    -- subtract two unsigned numbers of the same length
    -- both arrays must have range (msb downto 0)
    function unsigned_minus(A, B: BVUNSIGNED) return BVUNSIGNED is
	variable carry: BIT;
	variable BV: BIT_VECTOR (A'left downto 0);
	variable sum: BVUNSIGNED (A'left downto 0);

	-- pragma map_to_operator SUB_UNS_OP
	-- pragma type_function LEFT_UNSIGNED_ARG
        -- pragma return_port_name Z

    begin
	carry := '1';
	BV := not BIT_VECTOR(B);

	for i in 0 to A'left loop
	    sum(i) := A(i) xor BV(i) xor carry;
	    carry := (A(i) and BV(i)) or
		    (A(i) and carry) or
		    (carry and BV(i));
	end loop;
	return sum;
    end;


    -- add two unsigned numbers of the same length
    -- both arrays must have range (msb downto 0)
    function unsigned_plus(A, B: BVUNSIGNED) return BVUNSIGNED is
	variable carry: BIT;
	variable BV, sum: BVUNSIGNED (A'left downto 0);

	-- pragma map_to_operator ADD_UNS_OP
	-- pragma type_function LEFT_UNSIGNED_ARG
        -- pragma return_port_name Z

    begin
	carry := '0';
	BV := B;

	for i in 0 to A'left loop
	    sum(i) := A(i) xor BV(i) xor carry;
	    carry := (A(i) and BV(i)) or
		    (A(i) and carry) or
		    (carry and BV(i));
	end loop;
	return sum;
    end;


    -- Type propagation FUNCTION which returns a signed type with the
    -- size of the left arg.
    FUNCTION LEFT_SIGNED_ARG(A,B: BVSIGNED) return BVSIGNED is
      variable Z: BVSIGNED (A'left downto 0);
      -- pragma return_port_name Z
    begin
      return(Z);
    end;
	
    -- subtract two signed numbers of the same length
    -- both arrays must have range (msb downto 0)
    FUNCTION minus(A, B: BVSIGNED) return BVSIGNED is
	variable carry: BIT;
	variable BV: BIT_VECTOR (A'left downto 0);
	variable sum: BVSIGNED (A'left downto 0);

	-- pragma map_to_operator SUB_TC_OP

	-- pragma type_FUNCTION LEFT_SIGNED_ARG
        -- pragma return_port_name Z

    begin
	carry := '1';
	BV := not BIT_VECTOR(B);

	for i in 0 to A'left loop
	    sum(i) := A(i) xor BV(i) xor carry;
	    carry := (A(i) and BV(i)) or
		    (A(i) and carry) or
		    (carry and BV(i));
	end loop;
	return sum;
    end;

    -- add two signed numbers of the same length
    -- both arrays must have range (msb downto 0)
    FUNCTION plus(A, B: BVSIGNED) return BVSIGNED is
	variable carry: BIT;
	variable BV, sum: BVSIGNED (A'left downto 0);

	-- pragma map_to_operator ADD_TC_OP
	-- pragma type_FUNCTION LEFT_SIGNED_ARG
        -- pragma return_port_name Z

    begin
	carry := '0';
	BV := B;

	for i in 0 to A'left loop
	    sum(i) := A(i) xor BV(i) xor carry;
	    carry := (A(i) and BV(i)) or
		    (A(i) and carry) or
		    (carry and BV(i));
	end loop;
	return sum;
    end;


    FUNCTION "+"(L: BVSIGNED; R: BVSIGNED) return BVSIGNED is
	-- pragma label_applies_to plus
	constant length: INTEGER := bvmax(L'length, R'length);
    begin
	return plus(C_SIGNED(L, length),
		    C_SIGNED(R, length)); -- pragma label plus
    end;


    FUNCTION "-"(L: BVSIGNED; R: BVSIGNED) return BVSIGNED is
	-- pragma label_applies_to minus
	constant length: INTEGER := bvmax(L'length, R'length);
    begin
	return minus(C_SIGNED(L, length),
		     C_SIGNED(R, length)); -- pragma label minus
    end;


    FUNCTION "-"(L: INTEGER; R: BVSIGNED) return BVSIGNED is
	-- pragma label_applies_to minus
	constant length: INTEGER := R'length;
    begin
	return minus(C_SIGNED(L, length),
		     C_SIGNED(R, length)); -- pragma label minus
    end;


    FUNCTION "ABS"(L: BVSIGNED) return BVSIGNED is
    begin
	if L(L'left) = '0' then
	    return L;
	else
	    return 0 - L;
	end if;
    end;



    FUNCTION C_INTEGER(ARG: BVSIGNED) return INTEGER is
	variable result: INTEGER;
	-- synopsys built_in SYN_SIGNED_TO_INTEGER;
    begin
	-- synopsys synthesis_off
	assert ARG'length <= 32
	    report "ARG is too large in C_INTEGER"
	    severity FAILURE;
	result := 0;
	for i in ARG'range loop
	    if i /= ARG'left then
		result := result * 2;
		if ARG(i) = '1' then
		    result := result + 1;
		end if;
	    end if;
	end loop;
	if ARG(ARG'left) = '1' then
	    if ARG'length = 32 then
		result := (result - 2**30) - 2**30;
	    else
		result := result - (2 ** (ARG'length-1));
	    end if;
	end if;
	return result;
	-- synopsys synthesis_on
    end;


    FUNCTION C_INTEGER(ARG: BVUNSIGNED) return INTEGER is
	variable result: INTEGER;
	-- synopsys built_in SYN_UNSIGNED_TO_INTEGER;
    begin
	-- synopsys synthesis_off
	assert ARG'length <= 31
	    report "ARG is too large in C_INTEGER"
	    severity FAILURE;
	result := 0;
	for i in ARG'range loop
	    result := result * 2;
	    if ARG(i) = '1' then
		result := result + 1;
	    end if;
	end loop;
	return result;
	-- synopsys synthesis_on
    end;


    FUNCTION C_UNSIGNED(ARG: BVUNSIGNED; SIZE: INTEGER) return BVUNSIGNED is
	constant msb: INTEGER := bvmin(ARG'length, SIZE) - 1;
	subtype rtype is BVUNSIGNED (SIZE-1 downto 0);
	variable new_bounds: BVUNSIGNED (ARG'length-1 downto 0);
	variable result: rtype;
	-- synopsys built_in SYN_ZERO_EXTEND
    begin
	-- synopsys synthesis_off
	result := rtype'(others => '0');
	new_bounds := ARG;
	result(msb downto 0) := new_bounds(msb downto 0);
	return result;
	-- synopsys synthesis_on
    end;


    -- convert an integer to a 2's complement BIT_VECTOR
    FUNCTION C_SIGNED(ARG: INTEGER; SIZE: INTEGER) return BVSIGNED is
	variable result: BVSIGNED (SIZE-1 downto 0);
	variable temp: integer;
	variable negative: boolean;
	-- synopsys built_in SYN_INTEGER_TO_SIGNED
    begin
	-- synopsys synthesis_off
	temp := ARG;
	if temp < 0 then
	    -- In order to make the "/2" operation like a shift,
	    -- we need to make the arg a positive number.
	    temp := (temp + (2**30)) + (2**30);
	    negative := TRUE;
	else
	    negative := FALSE;
	end if;
	for i in  0 to SIZE-1 loop
	    if (temp mod 2) = 1 then
		result(i) := '1';
	    else 
		result(i) := '0';
	    end if;
	    temp := temp / 2;
	end loop;
	-- If we are converting a >31 bit number which is negative, 
	-- the high bits have been calculated incorrectly.
	if negative and (SIZE > 31) then
	    for i in 31 to SIZE-1 loop
		result(i) := '1';
	    end loop;
	end if;
	return result;
	-- synopsys synthesis_on
    end;


    FUNCTION C_SIGNED(ARG: BVSIGNED; SIZE: INTEGER) return BVSIGNED is
	constant msb: INTEGER := bvmin(ARG'length, SIZE) - 1;
	subtype rtype is BVSIGNED (SIZE-1 downto 0);
	variable new_bounds : BVSIGNED (ARG'length-1 downto 0);
	variable result: rtype;
	-- synopsys built_in SYN_SIGN_EXTEND
    begin
	-- synopsys synthesis_off
	result := rtype'(others => ARG(ARG'left));
	new_bounds := ARG;
	result(msb downto 0) := new_bounds(msb downto 0);
	return result;
	-- synopsys synthesis_on
    end;

--
--------
--
    FUNCTION bvtoi(x: BIT_VECTOR) RETURN INTEGER is
      -- pragma subpgm_id 30
	begin
		return C_INTEGER(BVUNSIGNED(x));
	end;


    FUNCTION sbvtoi(x: BIT_VECTOR) RETURN INTEGER is
      -- pragma subpgm_id 31
	begin
		return C_INTEGER(BVSIGNED(x));
	end;


    FUNCTION itobv(x: INTEGER;
                   length: INTEGER) RETURN BIT_VECTOR is
      -- pragma subpgm_id 38
    	variable result: BIT_VECTOR(length-1 downto 0);
	begin
		result := BIT_VECTOR(C_SIGNED(x,length));
		return (result);
	end;


    FUNCTION sxt(x: BIT_VECTOR;
                 length: INTEGER) RETURN BIT_VECTOR is
      -- pragma subpgm_id 32
    	variable result: BIT_VECTOR(length-1 downto 0);
	begin
		result := BIT_VECTOR(C_SIGNED(BVSIGNED(x),length));
		return (result);
	end;


    FUNCTION ext(x: BIT_VECTOR;
                 length: INTEGER) RETURN BIT_VECTOR is
      -- pragma subpgm_id 33
    	variable result: BIT_VECTOR(length-1 downto 0);
	begin
		result := BIT_VECTOR(C_UNSIGNED(BVUNSIGNED(x),length));
		return (result);
	end;


    FUNCTION "+"(left: BIT_VECTOR;
                 right: BIT_VECTOR) RETURN BIT_VECTOR is
      -- pragma subpgm_id 34
	begin
		return BIT_VECTOR(BVSIGNED(left) + BVSIGNED(right));
	end;


    FUNCTION "-"(left: BIT_VECTOR;
                 right: BIT_VECTOR) RETURN BIT_VECTOR is
      -- pragma subpgm_id 35
	begin
		return BIT_VECTOR(BVSIGNED(left) - BVSIGNED(right));
	end;


    FUNCTION "-"(right: BIT_VECTOR) RETURN BIT_VECTOR is
      -- pragma subpgm_id 36
	begin
		return BIT_VECTOR(0 - BVSIGNED(right));
	end;


    FUNCTION "abs"(right: BIT_VECTOR) RETURN BIT_VECTOR is
      -- pragma subpgm_id 37
	begin
		return BIT_VECTOR(ABS(BVSIGNED(right)));
	end;

end BV_ARITHMETIC;
