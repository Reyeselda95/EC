" DRINK1
"
PROCEDURE DRINK1(INPUT nickel, dime, quarter, clock;
	OUTPUT return_dime, return_nickel, dispense_drink);

" This state machine, by default, uses D_FLOPs to represent the current
" state.
"
" The CLOCKED_BY expression causes state transitions to occur when 
" the 'clock' signal transitions and the conditions for a particular
" GOTO are met.
"
STATE_MACHINE drink_machine CLOCKED_BY clock;
	STATE Zero:
		IF nickel THEN
			GOTO Five;
		ELSIF dime THEN
			GOTO Ten;
		ELSIF quarter THEN
			GOTO TwentyFive;
		ELSE
			GOTO Zero;
		END IF;
		dispense_drink = 0;
		return_dime = 0;
		return_nickel = 0;
	STATE Five:
		IF nickel THEN
			dispense_drink = 0;
			GOTO Ten;
		ELSIF dime THEN
			dispense_drink = 0;
			GOTO Fifteen;
		ELSIF quarter THEN
			dispense_drink = 1;
			GOTO Zero;
		ELSE
			dispense_drink = 0;
			GOTO Five;
		END IF;
		return_dime = 0;
		return_nickel = 0;
	STATE Ten:
		IF nickel THEN
			dispense_drink = 0;
			return_nickel = 0;
			GOTO Fifteen;
		ELSIF dime THEN
			dispense_drink = 0;
			return_nickel = 0;
			GOTO Twenty;
		ELSIF quarter THEN
			dispense_drink = 1;
			return_nickel = 1;
			GOTO Zero;
		ELSE
			dispense_drink = 0;
			return_nickel = 0;
			GOTO Ten;
		END IF;
		return_dime = 0;
	STATE Fifteen:
		IF nickel THEN
			dispense_drink = 0;
			return_dime = 0;
			GOTO Twenty;
		ELSIF dime THEN
			dispense_drink = 0;
			return_dime = 0;
			GOTO TwentyFive;
		ELSIF quarter THEN
			dispense_drink = 1;
			return_dime = 1;
			GOTO Zero;
		ELSE
			dispense_drink = 0;
			return_dime = 0;
			GOTO Fifteen;
		END IF;
		return_nickel = 0;
	STATE Twenty:
		IF nickel THEN
			dispense_drink = 0;
			return_nickel = 0;
			return_dime = 0;
			GOTO TwentyFive;

	ELSIF dime THEN
			dispense_drink = 1;
			return_nickel = 0;
			return_dime = 0;
			GOTO Zero;
		ELSIF quarter THEN
			dispense_drink = 1;
			return_dime = 1;
			return_nickel = 1;
			GOTO Zero;
		ELSE
			dispense_drink = 0;
			return_nickel = 0;
			return_dime = 0;
			GOTO Twenty;
		END IF;
	STATE TwentyFive:
		IF nickel THEN
			dispense_drink = 1;
			return_nickel = 0;
			return_dime = 0;
			GOTO Zero;
		ELSIF dime THEN
			dispense_drink = 1;
			return_nickel = 1;
			return_dime = 0;
			GOTO Zero;
		ELSIF quarter THEN
			dispense_drink = 1;
			return_nickel = 0;
			return_dime = 1;
			GOTO OweDime;
		ELSE
			dispense_drink = 0;
			return_nickel = 0;
			return_dime = 0;
			GOTO TwentyFive;
		END IF;
	STATE OweDime:
		" This state causes a wait of a clock cycle before 
		" trying to return a second dime.
		dispense_drink = 0;
		return_nickel = 0;
		return_dime = 1;
		GOTO Zero;
END drink_machine;
END DRINK1;

