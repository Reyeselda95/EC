" DRINK2

PROCEDURE DRINK2 (INPUT nickel, dime, quarter, clock, reset;
	OUTPUT return_dime, return_nickel, dispense_drink DEFAULT_TO 0);
"
" The CLOCKED_BY expression causes state transitions to occur when the 
" 'clock'signal transitions and the conditions for a particular GOTO
" are met.
"
" The RESET_BY expression causes the state machine to transition back to
" the first state (Zero) whenever the 'reset' signal is true.
"
" The DEFAULT_TO LAST_VALUE causes each state to transition to itself by
" default.  So, any GOTO from a state to itself is unnecessary.
"
STATE_MACHINE drink_machine
CLOCKED_BY clock RESET_BY reset DEFAULT_TO LAST_VALUE;
	STATE Zero:
		IF nickel THEN
			GOTO Five;
		ELSIF dime THEN
			GOTO Ten;
		ELSIF quarter THEN
			GOTO TwentyFive;
		END IF;
	STATE Five:
		IF nickel THEN
			GOTO Ten;
		ELSIF dime THEN
			GOTO Fifteen;
		ELSIF quarter THEN
			dispense_drink = 1;
			GOTO Zero;
		END IF;
	STATE Ten:
		IF nickel THEN
			GOTO Fifteen;
		ELSIF dime THEN
			GOTO Twenty;
		ELSIF quarter THEN
			dispense_drink = 1;
			return_nickel = 1;
			GOTO Zero;
		END IF;
	STATE Fifteen:
		IF nickel THEN
			GOTO Twenty;
		ELSIF dime THEN
			GOTO TwentyFive;
		ELSIF quarter THEN
			dispense_drink = 1;
			return_dime = 1;
			GOTO Zero;
		END IF;
	STATE Twenty:
		IF nickel THEN
			GOTO TwentyFive;
		ELSIF dime THEN
			dispense_drink = 1;
			GOTO Zero;
		ELSIF quarter THEN
			dispense_drink = 1;
			return_nickel = 1;
			return_dime = 1;
			GOTO Zero;
		END IF;
	STATE TwentyFive:
		IF nickel THEN
			dispense_drink = 1;
			GOTO Zero;
		ELSIF dime THEN
			return_nickel = 1;
			dispense_drink = 1;
			GOTO Zero;
		ELSIF quarter THEN
			dispense_drink = 1;
			return_dime = 1;
			GOTO OweDime;
		END IF;

STATE OweDime:
		" This state causes a wait of a clock cycle before 
		" trying to return a second dime.
		return_dime = 1;
		GOTO Zero;
	ELSE
		" This ELSE makes sure that the state machine resets itself
		" if it somehow gets into an undefined state.
		GOTO Zero;
END drink_machine;
END DRINK2;

