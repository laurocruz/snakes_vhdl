LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.math_real.all;

ENTITY create_food IS
    -- Altura e comprimento do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10);
    PORT (eaten : IN STD_LOGIC;
          game_map : IN STD_LOGIC_VECTOR(N*M DOWNTO 0)
	      new_food : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
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
	BEGIN
		IF (eaten = '1') THEN
			WHILE (game_map(index) = '1' and index = N*M) LOOP
				uniform(seed1, seed2, rand);   -- generate random number
				index := to_unsigned(rand*range_of_rand);  -- rescale to 0..1000, convert integer part 
			END LOOP;
			-- game_map(index) = '1';
		END IF:
		rand_num <= index;
	END PROCESS;

	new_food <= std_logic_vector(to_unsigned(rand_num, new_food'LENGTH))
	
end behavior;