LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY demo_make_map IS
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
             INITIAL_SIZE : INTEGER := 2);

    PORT (clock      : IN STD_LOGIC;
          reset      : IN STD_LOGIC;
			 eaten : STD_LOGIC;
			 snake_size : IN INTEGER RANGE 0 TO N*M;
			 dir : IN STD_LOGIC_VECTOR(1 DOWNTO 0));
END demo_make_map;

ARCHITECTURE Behavior OF demo_make_map IS
	SIGNAL snake_body : int_array;

BEGIN

	make_map1: make_map PORT MAP (clock, reset, eaten, snake_size, dir, snake_body);

END Behavior;
