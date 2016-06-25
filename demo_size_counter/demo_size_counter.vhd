LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

-- tamanho da cobra
ENTITY demo_size_counter IS
-- DImensões do mapa
    GENERIC (N : INTEGER := 8;
             M : INTEGER := 8;
             INITIAL_SIZE : INTEGER := 2);
    PORT (reset      : IN STD_LOGIC;
          snake_head : IN INTEGER RANGE 0 TO N*M-1;
          food_pos   : IN INTEGER RANGE 0 TO N*M-1;
          snake_size : OUT  INTEGER RANGE 0 TO N*M;
          eaten      : OUT  STD_LOGIC);
END demo_size_counter;

ARCHITECTURE Behavior OF demo_size_counter IS
BEGIN

	size_counter1: size_counter PORT MAP (reset, snake_head, food_pos, snake_size, eaten);

END Behavior;
