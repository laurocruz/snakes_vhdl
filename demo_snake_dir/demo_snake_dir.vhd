LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY demo_snake_dir IS
	PORT (reset : IN STD_LOGIC;
		  snake_turn : IN STD_LOGIC_VECTOR(1 downto 0));
END demo_snake_dir;

ARCHITECTURE Behavior OF demo_snake_dir IS
	SIGNAL dir : STD_LOGIC_VECTOR(0 to 1);
BEGIN
	
	snake_dir1: snake_dir PORT MAP(reset, snake_turn, dir);
	
END Behavior;
