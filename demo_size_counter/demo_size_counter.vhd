LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

-- tamanho da cobra
ENTITY demo_size_counter IS
-- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
             INITIAL_SIZE : INTEGER := 2);
    PORT (reset      : IN STD_LOGIC;
          food_pos   : IN INTEGER RANGE 0 TO N*M-1;
          snake_size : OUT  INTEGER RANGE 0 TO N*M;
          eaten      : OUT  STD_LOGIC);
END demo_size_counter;

ARCHITECTURE Behavior OF demo_size_counter IS
	SIGNAL snake_body : int_array;
BEGIN

	size_counter1: size_counter PORT MAP (reset, food_pos, snake_body(0), snake_size, eaten);

END Behavior;
