LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std;

-- tamanho da cobra
ENTITY size_counter IS
-- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
             INITIAL_SIZE : INTEGER := 2);
    PORT (reset      : IN STD_LOGIC;
          snake_head : IN INTEGER RANGE 0 TO N*M-1;
          food_pos   : IN INTEGER RANGE 0 TO N*M-1;
          snake_size : OUT  INTEGER RANGE 0 TO N*M;
          eaten      : OUT  STD_LOGIC);
END size_counter;

ARCHITECTURE Behavior OF size_counter IS
    SIGNAL size  : INTEGER RANGE 0 TO N*M := INITIAL_SIZE;
    SIGNAL eatens : STD_LOGIC := '0';

BEGIN

    eatens <= '1' WHEN food_pos = snake_head ELSE '0';

	PROCESS(eatens,reset)
        IF (reset'EVENT and reset = '1') THEN
            eatens <= '0';
            size <= INITIAL_SIZE;
		ELSIF (eatens'EVENT and eatens = 1) THEN
			size <= size + 1;
		END IF;
	END PROCESS;

    snake_size <= size;

    eaten <= eatens;

END Behavior;
