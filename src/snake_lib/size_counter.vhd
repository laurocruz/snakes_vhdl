LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

-- tamanho da cobra
ENTITY size_counter IS
-- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
             INITIAL_SIZE : INTEGER := 2);
    PORT (reset      : IN STD_LOGIC;
			 food_pos   : IN INTEGER RANGE -20 TO 255;
          --food_pos   : IN INTEGER RANGE 0 TO N*M-1;
          snake_head : IN INTEGER RANGE -20 TO 255;
          snake_size : OUT  INTEGER RANGE 0 TO N*M;
          eaten      : OUT  STD_LOGIC);
END size_counter;

ARCHITECTURE Behavior OF size_counter IS
    SIGNAL size  : INTEGER RANGE 0 TO N*M := INITIAL_SIZE;
    SIGNAL eatens : STD_LOGIC := '0';

BEGIN

    eatens <= '1' WHEN food_pos = snake_head ELSE '0';

	PROCESS(eatens,reset)
	BEGIN
        IF (reset = '1') THEN
            size <= INITIAL_SIZE;
		ELSIF (eatens'EVENT and eatens = '1') THEN
				size <= size + 1;
		END IF;
	END PROCESS;

    snake_size <= size;

    eaten <= eatens;

END Behavior;
