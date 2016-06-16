LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std;

-- tamanho da cobra
ENTITY size_counter IS
    PORT (eaten      : IN STD_LOGIC;
          snake_size : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END size_counter;

ARCHITECTURE Behavior OF size_counter IS
	SIGNAL counter : integer range 0 to 255 := 0;
	
BEGIN
	PROCESS(eaten)
		IF (eaten'EVENT and eaten = 1) THEN
			counter <= counter + 1;
		END IF;
	END PROCESS;
	
	snake_size <= std_logic_vector(to_unsigned(counter, snake_size'LENGTH));
END Behavior;
