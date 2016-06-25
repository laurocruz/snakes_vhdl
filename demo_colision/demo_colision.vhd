LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY demo_colision IS
-- DImensões do mapa
	GENERIC (N : INTEGER := 10;
            M : INTEGER := 10);
	PORT (dir        : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			reset      : IN STD_LOGIC;
         gmap       : OUT STD_LOGIC_VECTOR(0 to N*M-1);
         lost       : OUT STD_LOGIC);
END demo_colision;

ARCHITECTURE Behavior OF demo_colision IS
	SIGNAL snake_body : int_array;
BEGIN
	colision1: colision PORT MAP (snake_body, dir, reset, gmap, lost);
END Behavior;