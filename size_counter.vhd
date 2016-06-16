LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std;

-- tamanho da cobra
ENTITY size_counter IS
    PORT (eaten      : IN STD_LOGIC;
          snake_size : BUFFER  STD_LOGIC_VECTOR(7 DOWNTO 0));
END size_counter;

ARCHITECTURE Behavior OF size_counter IS
    COMPONENT conv_7seg IS
        PORT (digit: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
                seg: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
        END COMPONENT;

    SIGNAL counter : integer range 0 to 255 := 0;
	
BEGIN
	PROCESS(eaten)
		IF (eaten'EVENT and eaten = 1) THEN
			counter <= counter + 1;
		END IF;
	END PROCESS;
	
	snake_size <= std_logic_vector(to_unsigned(counter, snake_size'LENGTH));
        saida_contador: conv_7seg PORT MAP (snake_size, seg); 
END Behavior;
