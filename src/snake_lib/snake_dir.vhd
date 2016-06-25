LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY snake_dir IS
	PORT (reset : IN STD_LOGIC;
		  snake_turn : IN STD_LOGIC_VECTOR(1 downto 0);
		  dir : BUFFER STD_LOGIC_VECTOR(0 to 1));
END snake_dir;

ARCHITECTURE Behavior OF snake_dir IS
	BEGIN
	PROCESS(snake_turn(0), snake_turn(1), reset)
		BEGIN
		IF (reset = '1') THEN
			dir <= "11";
		ELSIF (snake_turn(0) = '1') THEN
			IF (dir = "00") THEN
				dir <= "01";
			ELSIF (dir = "01") THEN
				dir <= "11";
			ElSIF (dir = "11") THEN
				dir <= "10";
			ELSE
				dir <= "00";
			END IF;

		ELSIF (snake_turn(1) = '1') THEN
			IF (dir = "00") THEN
				dir <= "10";
			ELSIF (dir = "10") THEN
				dir <= "11";
			ELSIF (dir = "11") THEN
				dir <= "01";
			ELSE
				dir <= "00";
			END IF;
		END IF;
	END PROCESS;
END Behavior;
