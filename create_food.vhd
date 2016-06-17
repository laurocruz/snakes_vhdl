LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.math_real.all;

ENTITY create_food IS
    -- Altura e comprimento do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10);
    PORT (eaten : IN STD_LOGIC;
          snake_body : IN array (0 to N*M-1) OF INTEGER RANGE 0 TO N*M-1;
          snake_size : IN INTEGER RANGE 0 to N*M;
	      new_food : OUT INTEGER RANGE 0 TO N*M-1);
          -- Guarda no máximo 255
END create_food;

ARCHITECTURE Behavior of create_food is
	SIGNAL rand_num : INTEGER := 0;

BEGIN

	PROCESS(eaten)
		variable seed1, seed2: positive;               -- seed values for random generator
		variable rand: real;   -- random real-number value in range 0 to 1.0
		variable range_of_rand : real := 99.0;    -- the range of random values created will be 0 to +1000.
		variable index : integer := M*N;
        variable conflict : integer := 1;
        variable getout : integer := 1;
	BEGIN
		IF (eaten'EVENT and eaten = '1') THEN
			WHILE (conflict = 1 or index = N*M) LOOP
                conflict := 1;
                getout := 1;
				uniform(seed1, seed2, rand);   -- generate random number
				index := to_unsigned(rand*range_of_rand);  -- rescale to 0..1000, convert integer part

                FOR I IN 0 to snake_size-1 LOOP
                    IF (snake_body(i) = index) THEN
                        getout := 0;
                    END IF;
                END LOOP;

                IF (getout = 1) THEN
                    conflict := 0;
                END IF;

			END LOOP;
			-- game_map(index) = '1';
		END IF;
		rand_num <= index;
	END PROCESS;

	new_food <= rand_num;

end Behavior;
