LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY demo_create_food IS
    -- Altura e comprimento do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
             width : INTEGER := 6);
    PORT (reset : IN STD_LOGIC;
				eaten : IN STD_LOGIC;
          gmap  : IN STD_LOGIC_VECTOR(0 TO N*M-1);
	      new_food : OUT INTEGER RANGE 0 TO N*M-1);
END demo_create_food;
------------------------------------------------------------------------------------------------------------

ARCHITECTURE Behavior of demo_create_food is

BEGIN

	create_food1: create_food PORT MAP (reset, eaten, gmap, new_food);

END Behavior;

-------------------------------------------------------------------------------------------------------------
